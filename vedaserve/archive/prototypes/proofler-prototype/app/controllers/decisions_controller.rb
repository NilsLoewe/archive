class DecisionsController < ApplicationController
  layout 'dmc'

  before_action :set_decision, only: [:show, :options, :invite, :done, :evaluate, :participate, :facts, :decide, :review, :edit, :update, :destroy, :settings, :general, :close, :copy]

  # GET /decisions
  # GET /decisions.json
  def index
    @decisions = Decision.all
  end

  # GET /decisions/1
  # GET /decisions/1.json
  def show
    redirect_to :action =>"options"
  end

  def participate
    @participant = Participant.new
  end

  def close
    Rails.logger.info("Decision #{@decision.inspect} should end with #{params['option']}")
    option = params['option'].to_i

    @decision.closed = true
    @decision.chosen_option = option
    @decision.save

    redirect_to dashboard_participant_path(params['participant'].to_i)
  end

  def options
    @option = Option.new
    @fact = Fact.new
  end

  def general
  end

  def settings
  end

  def invite
    @user = User.new
    @participant = @decision.participants.first
    if @participant.invited == false
      UserMailer.participate_email(@participant).deliver
      @participant.invited = true
      @participant.save
    end
  end

  def evaluate
    @user = User.find(@decision.user_id)
  end

  def facts
    @fact = Fact.new
    @user = User.find(@decision.user_id)
  end

  def decide
    @unanswered = 0
    @orderedFacts = @decision.facts.sort_by {|fact| fact.points }.reverse
    @orderedOptionsGut = @decision.options.sort_by {|fact| fact.guts_value }.reverse
    @orderedOptionsPoints = @decision.options.sort_by {|fact| fact.points }.reverse
    @orderedOptions = @decision.options.sort_by {|option| option.value }.reverse
    @unanswered = 0

  end

  def review
  end

  def done
  end

  # GET /decisions/new
  def new
    @decision = Decision.new
    @decision.title = params[:title]
  end

  # GET /decisions/1/edit
  def edit
  end

  def copy
    @decision = Decision.find(params[:id])

    @new_decision = Decision.new
    @new_decision.title = @decision.title
  end

  def duplicate
    @decision = Decision.find(params[:clone_id])

    @new_decision = @decision.dup

    # Create primary user (the admin)
    user = User.new
    user.email = params[:email]
    user.name = params[:author]
    user.save

    @new_decision.user_id = user.id
    @new_decision.cloned = true
    @new_decision.closed = false
    @new_decision.title = params[:title]
    @new_decision.email = params[:email]
    @new_decision.author = params[:author]
    @new_decision.clone_id = @decision.id
    @new_decision.save

    @clone = Clone.new
    @clone.decision_id = @decision.id
    @clone.clone_id = @new_decision.id

    # Create participant entry for the user
    @participant = Participant.new
    @participant.decision_id = @new_decision.id
    @participant.user_id = user.id
    @participant.invited = false
    @participant.admin = true
    @participant.save

    @decision.options.each do |o|
      @new_option = o.dup
      @new_option.decision_id = @new_decision.id
      @new_option.save
    end

    @new_decision.options.each do |o|
      @guts = Guts.new
      @guts.option_id = o.id
      @guts.value = 0
      @guts.user_id = user.id
      @guts.save
    end

    @decision.facts.each do |f|
      @new_fact = f.dup
      @new_fact.decision_id = @new_decision.id
      @new_fact.save
    end

    @new_decision.facts.each do |f|
      @new_decision.options.each do |o|

        allocation = Allocation.new
        allocation.option_id = o.id
        allocation.fact_id = f.id

        @decision.options.each do |o1|
          if o.title == o1.title
            o1.allocations.each do |a|
             if f.title == a.fact.title
                allocation.direction = a.direction
                allocation.question  = a.question
                allocation.relevant  = a.relevant
                allocation.value     = a.value
              end
            end
          end
        end

        allocation.save
      end

      @rating = FactRating.new
      @rating.fact_id = f.id
      @rating.value = 0
      @rating.user_id = user.id
      @rating.save
    end

    redirect_to dashboard_participant_path(@participant)
  end

  # POST /decisions
  # POST /decisions.json
  def create
    if params[:create_button]
      redirect_to new_decision_path(:title => params[:decision][:title])

    elsif params[:copy_button]
      redirect_to duplicate_decision_path(:id       => params[:decision][:clone_id],
                                          :clone_id => params[:decision][:clone_id],
                                          :title    => params[:decision][:title],
                                          :author   => params[:decision][:author],
                                          :email    => params[:decision][:email])
    else
      @decision = Decision.new(decision_params)
      @decision.state = "options"
      @decision.ratio = 0
      @decision.save

      # Create primary user (the admin)
      user = User.new
      user.email = @decision.email
      user.name = @decision.author
      user.save

      @decision.user_id = user.id
      @decision.save

      # Create participant entry for the user
      @participant = Participant.new
      @participant.decision_id = @decision.id
      @participant.user_id = user.id
      @participant.invited = false
      @participant.admin = true
      @participant.save


      if @participant.invited == false
        UserMailer.participate_email(@participant).deliver
        @participant.invited = true
        @participant.save
      end

      redirect_to dashboard_participant_path(@participant)
    end

  end

  # PATCH/PUT /decisions/1
  # PATCH/PUT /decisions/1.json
  def update
    if params[:copy_button]
      redirect_to copy_decision_path(:id => params[:decision][:decision_id])
    else
      @decision.update(decision_params)
      @user = @decision.user
      @user.name = @decision.author
      @user.email = @decision.email
      @user.save

      if @decision.state == "rating"
        @decision.participants.each do |p|
          UserMailer.rate_email(p).deliver
        end
      end

      redirect_to :back
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decision
      @decision = Decision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decision_params
      params.require(:decision).permit(:title, :description, :author, :email, :user_id, :ratio, :state)
    end
end
