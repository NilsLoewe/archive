class ParticipantsController < ApplicationController
  respond_to :html

  before_filter :load_decision
  before_filter :existing_participants

  def new
    @participant = @decision.participants.build
    respond_modal_with @participant
  end

  def create
    @participant = @decision.participants.build(participant_params)

    @participant.subscribe(Postman.instance)

    @participant.save
    respond_modal_with @participant, location: dashboard_path(token: @token)
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email)
  end

  def existing_participants
    @existing_participants = @decision.participants - [@participant]
  end
end
