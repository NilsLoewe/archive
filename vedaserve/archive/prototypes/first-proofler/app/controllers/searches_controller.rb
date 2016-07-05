class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  def show
    session[:search_id] = params[:id]
    redirect_to :back
  end

  def create
    @search = params[:type].constantize.new
    @search.title = @search.type
    @question = Question.find(params[:question_id])
    @question.searches << @search
    redirect_to :back
  end

  def update
    @search = Search.find(params[:id])
    @search.update_attributes(params[:search])
    redirect_to :back
  end

  private


    def set_type
      @type = search
    end

    def search_params
      params.require(params[:search]).permit(:title)
    end

end
