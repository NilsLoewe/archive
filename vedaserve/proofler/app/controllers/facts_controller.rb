class FactsController < ApplicationController
  respond_to :html, :json

  before_filter :load_decision, only: [:create, :update, :destroy]

  def new
    @fact = Fact.new
    respond_modal_with @fact
  end

  def create
    @option_id = params[:fact][:option_id]
    @fact = @decision.facts.create(fact_params.merge(creator: @participant))
    @fact.save
    assign_value if params[:fact][:assignment].present?
    respond_to do |format|
      format.js
    end
  end

  def edit
    @fact = Fact.find(params[:id])
    respond_modal_with @fact
  end

  def update
    @fact = Fact.find(params[:id])
    @fact.update(fact_params)
    respond_modal_with @fact, location: dashboard_path(token: @token)
  end

  def destroy
    @fact = Fact.find(params[:id])
    @fact.destroy
    redirect_to dashboard_path(token: @token)
  end

  private

  def load_decision
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
    @decision = @participant.decision
  end

  def fact_params
    params.require(:fact).permit(:title, :decision_id, :creator_id, :datatype)
  end

  def assign_value
    @assignment = Assignment.where(option_id: params[:fact][:option_id]).where(fact_id: @fact.id).first
    @assignment.update_attribute(:value, params[:fact][:assignment][:value]) if params[:fact][:assignment][:value].present?
  end
end
