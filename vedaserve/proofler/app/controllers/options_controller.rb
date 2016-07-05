class OptionsController < ApplicationController
  respond_to :html, :json

  before_filter :load_decision, only: [:create, :update, :destroy]

  def new
    @option = Option.new
    respond_modal_with @option
  end

  def create
    @option = @decision.options.create(option_params.merge(creator: @participant))
    @option.save
    respond_to do |format|
      format.js
    end
  end

  def edit
    @option = Option.find(params[:id])
    respond_modal_with @option, location: dashboard_path(token: @token)
  end

  def update
    @option = Option.find(params[:id])
    @option.update(option_params)
    respond_modal_with @option, location: dashboard_path(token: @token)
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy
    redirect_to dashboard_path(token: @token)
  end

  private

  def load_decision
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
    @decision = @participant.decision
  end

  def option_params
    params.require(:option).permit(:title, :decision_id, :link, :description)
  end
end
