class FactsController < ApplicationController
  before_action :set_fact, only: [:show, :edit, :update, :destroy, :valid, :invalid, :pos, :neg, :binary, :discrete, :range]

  # GET /facts
  # GET /facts.json
  def index
    @facts = Fact.all
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
    @participant = Participant.find(params[:participant_id])
    @decision = Decision.find(@participant.decision_id)
    @user = User.find(@participant.user_id)
    @comment = Comment.new
    @fact_asset = FactAsset.new
  end

  # GET /facts/new
  def new
    @fact = Fact.new
  end

  # GET /facts/1/edit
  def edit
  end

  def valid
    @fact.title = @fact.old
    @fact.question = false
    @fact.save
    redirect_to :back
  end

  def invalid
    @fact.title = "Nicht " + @fact.old
    @fact.question = false
    @fact.inverse = true
    @fact.save
    redirect_to :back
  end

  def binary
    @fact.type = "binary"
    @fact.save
    redirect_to :back
  end

  def range
    @fact.type = "range"
    @fact.save
    redirect_to :back
  end

  def discrete
    @fact.type = "discrete"
    @fact.save
    redirect_to :back
  end

  def pos
    @fact.neg = false
    @fact.save
    redirect_to :back
  end

  def neg
    @fact.neg = true
    @fact.save
    redirect_to :back
  end

  # POST /facts
  # POST /facts.json
  def create
    @decision = Decision.find(params[:fact][:decision_id])
    @fact = Fact.new(fact_params)
    @fact.neg = false
    @fact.save

    # Create allocations for new fact
    @decision.options.each do |o|
      allocation = Allocation.new
      allocation.option_id = o.id
      allocation.direction = true
      allocation.question = true
      allocation.relevant = true
      allocation.fact_id = @fact.id
      if (params[:option_id].to_i == o.id)
        allocation.question = false
        allocation.value = params[:value]
      end
      allocation.save
    end

    #Bewertung für alle User
    @decision.participants.each do |p|
      @rating = FactRating.new
      @rating.fact_id = @fact.id
      @rating.value = -10
      @rating.user_id = p.user.id
      @rating.save
    end

    redirect_to :back

  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    respond_to do |format|
      if @fact.update(fact_params)
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fact_params
      params.require(:fact).permit(:title, :decision_id, :description, :type)
    end
end
