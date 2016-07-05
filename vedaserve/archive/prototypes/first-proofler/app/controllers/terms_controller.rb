class TermsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :research?, :only => [:create, :destroy]
  before_filter :load_question, :only => [:create, :update]
  before_action :load_term, only: [:show, :edit, :update, :destroy]

  def create
    @term = @question.terms.build(params[:term])
    if @term.save
      flash[:success] = 'Keyword added'
      session[:term_id] = @term.id
    else
      flash[:success] = 'Error'
    end

    redirect_to :back
  end

  def show
    session[:term_id] = params[:id]
    @term = current_term
    redirect_to :back
  end

  def update
    redirect_to :back
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_term
    @term = current_term
  end
end
