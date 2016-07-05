class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy, :select, :unselect]

  # GET /options
  # GET /options.json
  def index
    @options = Option.all
  end

  # GET /options/1
  # GET /options/1.json
  def show
    @participant = Participant.find(params[:participant_id])
    @decision = Decision.find(@participant.decision_id)
    @user = User.find(@participant.user_id)
    @comment = Comment.new
    @fact = Fact.new
    @option_asset = OptionAsset.new
  end

  # GET /options/new
  def new
    @option = Option.new
  end

  # GET /options/1/edit
  def edit
  end

  def select
    @option.selected = true
    @option.save
    redirect_to :back
  end

  def unselect
    @option.selected = false
    @option.save
    redirect_to :back
  end

  # POST /options
  # POST /options.json
  def create
    @option = Option.new(option_params)
    @option.save

    @decision = Decision.find(@option.decision_id)
   
    @decision.facts.each do |f|
      allocation = Allocation.new
      allocation.option_id = @option.id
      allocation.fact_id = f.id
      allocation.direction = true
      allocation.question = true
      allocation.relevant = true
      allocation.save
    end
    
    #Bauchgefühl für alle User
    @decision.participants.each do |p|
      @guts = Guts.new
      @guts.option_id = @option.id
      @guts.value = 0
      @guts.user_id = p.user.id
      @guts.save
    end
        
    redirect_to :back
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params.require(:option).permit(:title, :decision_id, :guts, :rated, :description)
    end
end
