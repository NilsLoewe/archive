class AllocationsController < ApplicationController
  before_action :set_allocation, only: [:show, :edit, :update, :destroy, :valid, :invalid, :irrelevant, :pro, :null, :con, :undo]

  # GET /facts
  # GET /facts.json
  def index
    @facts = Fact.all
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
  end

  # GET /facts/new
  def new
    @fact = Fact.new
  end

  # GET /facts/1/edit
  def edit
  end

  def valid
    @allocation.question = false
    @allocation.direction = true
    @allocation.relevant = true
    @allocation.save
    redirect_to :back
  end

  def invalid
    @allocation.question = false
    @allocation.direction = false
    @allocation.relevant = true
    @allocation.save
    redirect_to :back
  end

  def irrelevant
    @allocation.question = false
    @allocation.direction = false
    @allocation.relevant = false
    @allocation.save
    redirect_to :back
  end

  # POST /facts
  # POST /facts.json
  def create
    @decision = Decision.find(params[:fact][:decision_id])
    @fact = Fact.new(fact_params)
    @fact.save
    
    @decision.options.each do |o|
      allocation = Allocation.new
      allocation.option_id = o.id
      allocation.fact_id = @fact.id
      allocation.direction = true
      
      if params[:fact][:option].to_i != o.id
        allocation.question = true
        allocation.irrelevant = false
      else
        allocation.question = false
        allocation.irrelevant = true
      end
      
      allocation.save
    end

    redirect_to :back 

  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    respond_to do |format|
      if @allocation.update(allocation_params)
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
    def set_allocation
      @allocation = Allocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allocation_params
      params.require(:allocation).permit(:title, :value, :question)
    end
end
