class ResearchesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @research = current_user.researches.build(params[:research])
    if @research.save
      flash[:success] = "Research added"
      @research.populate
      redirect_to @research
    else
      flash[:success] = "Error"
      redirect_to root_path
    end
  end

  #def update
  #  @research = current_research
  #  @research.update_attributes(params[:research])
  #end

  def show
    @research = Research.find(params[:id])
    session[:research_id] = @research.id
    @new_question = Question.create(title: "")
    @questions = @research.questions.enabled

    session[:result_id] = nil
  end

  def select
    @research = Research.find(params[:id])
    session[:research_id] = @research.id
    @new_question = Question.create(title: "")
    @new_topic = Topic.create(title: "")
    @topics = @research.topics
  end

  def index
    @researches = current_user.researches
    @new_research = Research.create(title: "")  if user_signed_in?
  end

  def export
    @research = Research.find(params[:id])
  end

end
