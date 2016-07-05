class ParticipantsController < ApplicationController
  layout 'dmc'

  before_action :set_participant, only: [:show, :edit, :update, :destroy, :start, :show_options, :show_facts, :evaluate, :invite, :decide, :comments, :dashboard]

  def index
    @participants = Participant.all
  end

  def start
    @comment = Comment.new
  end

  def comments
    @comment = Comment.new
  end

  def show_options
    @option = Option.new
  end

  def option
    @participant = Participant.find(params[:participant_id])
    @option = Option.find(params[:id])
  end

  def show_facts
    @fact = Fact.new
  end

  def dashboard
    @newuser = User.new
    @option = Option.new
    @fact = Fact.new
    @image = Image.new
    @option_asset = OptionAsset.new

    @ordered_options = @decision.options.all.sort {|a,b| b.points <=> a.points}

    @next_rating = @participant.user.fact_ratings.notset.first
    @next_bauch = @participant.user.guts.notset.first
  end

  def evaluate
  end

  def decide
    @orderedFacts = @decision.facts.sort_by {|fact| fact.points }.reverse
    @orderedOptionsGut = @decision.options.sort_by {|fact| fact.guts_value }.reverse
    @orderedOptionsPoints = @decision.options.sort_by {|fact| fact.points }.reverse
  end

  def invite
    UserMailer.participate_email(@participant).deliver
    @participant.invited = true
    @participant.save
    redirect_to :back
  end

  def create

    @user = User.new
    @user.name = params[:participant][:name]
    @user.email = params[:participant][:email]
    @user.save

    @decision = Decision.find(params[:participant][:decision_id])

    @participant = Participant.new
    @participant.decision_id = @decision.id
    @participant.user_id = @user.id
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
      @rating.value = -10
      @rating.user_id = @user.id
      @rating.save
    end

    @comment = Comment.new
    redirect_to dashboard_participant_path(@participant)
  end

  def update
    if params[:participant][:type] == "options"
      params[:option].each do |o|
        @option = Option.find(o[0])
        @gut = Guts.where(user_id: @participant.user.id, option_id: @option.id).first
        @gut.value = o[1][:value]
        @gut.save
      end
    end

    if params[:participant][:type] == "facts"
      params[:fact].each do |f|
        @fact = Fact.find(f[0])
        @fact_rating = FactRating.where(user_id: @participant.user.id, fact_id: @fact.id).first
        @fact_rating.value = f[1][:value]
        @fact_rating.save
      end
    end
    redirect_to dashboard_participant_path(@participant)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
      @decision = Decision.find(@participant.decision_id)
      @user = User.find(@participant.user_id)
      @comment = Comment.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:title)
    end
end
