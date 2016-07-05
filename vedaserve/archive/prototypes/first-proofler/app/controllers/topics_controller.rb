class TopicsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :research?, :only => [:create, :destroy, :select]

  def create
    @topic = @research.topics.build(params[:topic])
    if @topic.save
      flash[:success] = "Topic added"
    else
      flash[:success] = "Error"
    end

    redirect_to :back
  end

  # Not needed until now
  #def destroy
  #  @topic = Topic.find(params[:id])
  #  @topic.destroy
  #  redirect_to current_research
  #end

  def show
    @topic = Topic.find(params[:id])
    @new_question = Question.create(title: "")
    @research = current_research
  end

end
