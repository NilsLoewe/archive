class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to :back
  end

  def update
    if @comment.update(comment_params)
      redirect_to :back
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment, :user_id, :option_id)
    end
end
