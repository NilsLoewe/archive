class FactRatingsController < ApplicationController
  respond_to :html, :json

  before_filter :load_decision, only: [:update]

  def edit
    @fact_rating = FactRating.find(params[:id])
    respond_modal_with @fact_rating
  end

  def update
    @fact_rating = FactRating.find(params[:id])
    @fact_rating.update(fact_rating_params)
    update_fact_ratings if params[:fact_rating][:assignment_ratings]
    respond_modal_with @fact_rating, location: dashboard_path(token: @token)
  end

  private

  def load_decision
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
    @decision = @participant.decision
  end

  def fact_rating_params
    params.require(:fact_rating).permit(:value)
  end

  def update_fact_ratings
    params[:fact_rating][:assignment_ratings].each do |a|
      assignment_rating = AssignmentRating.find(a[0])
      assignment_rating.rating = a[1]
      assignment_rating.save
    end
  end
end
