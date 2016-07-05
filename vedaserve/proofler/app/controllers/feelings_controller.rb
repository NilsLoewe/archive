class FeelingsController < ApplicationController
  respond_to :html, :json

  before_filter :load_decision, only: [:update]

  def edit
    @feeling = FactRating.find(params[:id])
    respond_modal_with @feeling
  end

  def update
    @feeling = Feeling.find(params[:id])
    @feeling.update(feeling_params) if params[:feeling]
    respond_modal_with @feeling, location: dashboard_path(token: @token)
  end

  private

  def load_decision
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
    @decision = @participant.decision
  end

  def feeling_params
    params.require(:feeling).permit(:value, :favourite)
  end
end
