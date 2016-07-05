class AssignmentsController < ApplicationController
  respond_to :html, :json

  before_filter :load_decision, only: [:update]

  def edit
    @assignment = Assignment.find(params[:id])
    respond_modal_with @assignment
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update(assignment_params)

    respond_to do |format|
      format.html { respond_modal_with @assignment, location: dashboard_path(token: @token) }
      format.json
    end
  end

  private

  def load_decision
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
    @decision = @participant.decision
  end

  def assignment_params
    params.require(:assignment).permit(:value)
  end
end
