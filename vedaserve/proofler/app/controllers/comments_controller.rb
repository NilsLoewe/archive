class CommentsController < ApplicationController
  respond_to :html, :json

  before_filter :load_decision, only: [:create, :update]

  def new
    @comment = Comment.new
    respond_modal_with @comment
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.decision_id = @decision.id
    @comment.participant_id = @participant.id
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  private

  def load_decision
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
    @decision = @participant.decision
  end

  def comment_params
    params.require(:comment).permit(:comment, :commentable_id, :commentable_type)
  end
end
