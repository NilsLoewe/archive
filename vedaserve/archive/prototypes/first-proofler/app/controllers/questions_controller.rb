class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :research?, :only => [:create, :destroy, :select]
  before_filter :load_question, :only => [:enable, :destroy, :answer_describe, :answer_improve, :answer_gather, :answer_analyze, :answer_shape, :answer_process]
  before_filter :load_search, :only => [:answer_gather, :answer_analyze, :answer_shape, :answer_process]
  before_filter :load_dataobject, :only => [:answer_gather, :answer_analyze, :answer_process]

  def create
    @topic = Topic.find(params[:question][:topic_id])
    @question = @topic.questions.build(params[:question])
    @question.enable = true
    @question.custom = true
    if @question.save
      flash[:success] = "Question added"
    else
      flash[:success] = "Error"
    end

    redirect_to :back
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    if params[:categories]
      @question.research_categories = params[:categories]
    end
    @question.save

    redirect_to :back
  end

  def destroy
    @question.destroy if @question.custom
    redirect_to current_research
  end

  def show
    redirect_to current_research
  end

  def select
    @new_question = Question.create(title: "")
    @questions = @research.questions
  end

  def enable
    if @question.update_attributes(:enable => params[:enable])
      # ... update successful
    else
      # ... update failed
    end

    redirect_to :back
  end

  def answer_process
    @new_dataobject = Dataobject.new
    @sources = []
    @sources = Source.with_category(@search.type) if search?
  end

  def answer_describe
  end

  def answer_improve
    @new_term = Term.new
    @improvements = []

    case params[:query]
    when "synonyms"
      if term?
        @term = current_term
        #@term.extraxtSynonymsFromOpenThesaurus
        @synonyms = @term.getSynonyms
      end
    when "stats"
      if term?
        @term  = current_term
        @stats = @term.getStats
      end
    end
  end

  def answer_gather
    @new_dataobject = Dataobject.new

    unless params[:type]
      @categories = @question.research_categories
      @searches = @question.searches
    else
      @categories = []
      @categories << @question.research_categories.detect { |c| c == params[:type] }
      @searches = @question.searches.where(:type => params[:type])
    end

    @sources = []
    @sources = Source.with_category(@search.type) if search?
  end

  def answer_analyze
    @scored = @search.dataobjects.where("score > 0")
    @unscored = @search.dataobjects.where("score = 0")
  end

  def answer_shape
    @scored = @search.dataobjects.where("score > 0")
  end

  private

    def load_question
      @question = Question.find(params[:id])
    end

    def load_search
      if search?
        @search = current_search
      end
    end

    def load_dataobject
      if dataobject?
        @dataobject = current_dataobject
      end
    end

end
