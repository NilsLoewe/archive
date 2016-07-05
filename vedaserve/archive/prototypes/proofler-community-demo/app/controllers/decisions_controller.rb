class DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :edit, :update, :destroy, :dashboard]

  # GET /decisions
  # GET /decisions.json
  def index
    @decisions = Decision.all
  end

  # GET /decisions/1
  # GET /decisions/1.json
  def show
  end

  # GET /decisions/new
  def new
    @decision = Decision.new
  end

  # GET /decisions/1/edit
  def edit
  end

  # POST /decisions
  # POST /decisions.json
  def create
    @decision = Decision.new(decision_params)

    respond_to do |format|
      if @decision.save
        format.html { redirect_to dashboard_decision_path(@decision), notice: 'Decision was successfully created.' }
        format.json { render action: 'show', status: :created, location: @decision }
      else
        format.html { render action: 'new' }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decisions/1
  # PATCH/PUT /decisions/1.json
  def update
    respond_to do |format|
      if @decision.update(decision_params)
        format.html { redirect_to :back }#@decision, notice: 'Decision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decisions/1
  # DELETE /decisions/1.json
  def destroy
    @decision.destroy
    respond_to do |format|
      format.html { redirect_to decisions_url }
      format.json { head :no_content }
    end
  end

  def dashboard
    @source = Source.new
    @question = Question.new
    @constraint = Constraint.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decision
      @decision = Decision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decision_params
      params.require(:decision).permit(:description, :constrains, :title, :user_id, :answer)
    end
end
