class SearchesController < ApplicationController
  layout 'dmc'

  def index
  end

  def show
    @decision = Decision.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create

    if params[:create_button]
      redirect_to new_decision_path(:title => params[:search][:title])
    else
      @search = Search.new(search_params)
      @search.save


      s = @search.title.dup
      s.slice! "Soll"
      s.slice! "soll"
      s.slice! "Ich"
      s.slice! "ich"
      s.slice! "mir"
      s.slice! "Mir"
      s.slice! "ein"
      s.slice! "eine"
      s.slice! "kaufen"
      s.slice! "vs"

      @results = PgSearch.multisearch(s)

      @decisions = []

      @results.each do |r|

        case r.searchable
          when Decision
            @result = r.searchable
          when Option
            @result = r.searchable.decision
          when Fact
            @result = r.searchable.decision
        end
        
        if @result
          unless @decisions.include?(@result)
            unless @result.cloned?
               @decisions << @result
            end  
          end
        end
      end  

      @decision = Decision.new
      @decision.title = params[:search][:title]

      render 'results'
    end

  end

  def update
  end

  def destroy
  end

  private
    def set_option
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:title)
    end
end
