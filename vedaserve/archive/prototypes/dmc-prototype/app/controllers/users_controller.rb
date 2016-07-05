class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.save

    @decision = Decision.find(params[:user][:decision_id])

    @participant = Participant.new
    @participant.decision_id = @decision.id
    @participant.user_id = @user.id
    @participant.invited = false
    @participant.save

    #Bauchgefühl für alle Optionen
    @decision.options.each do |o|
      @guts = Guts.new
      @guts.option_id = o.id
      @guts.value = 0
      @guts.user_id = @user.id
      @guts.save
    end

    #Bewertung für alle User
    @decision.facts.each do |f|
      @rating = FactRating.new
      @rating.fact_id = f.id
      @rating.value = 0
      @rating.user_id = @user.id
      @rating.save
    end

    @comment = Comment.new

    if @participant.invited == false
      UserMailer.participate_email(@participant).deliver
      @participant.invited = true
      @participant.save
    end

    redirect_to :back
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :back, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
