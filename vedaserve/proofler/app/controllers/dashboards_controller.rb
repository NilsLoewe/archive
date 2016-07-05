class DashboardsController < ApplicationController
  before_filter :load_decision

  # Massive refactoring needed as soon as tests and final views are ready!!!
  def show
    @comment = Comment.new
    @token = params[:token]
    @existing_participants = @decision.participants
    send(@decision.state) unless @decision.state.nil?
    gather if @partial.nil?
  end

  private

  def load_decision
    @participant = Participant.find_by(invitation_token: params[:token])
    @participant.update_attribute(:status, "accepted") unless @participant.status == "accepted"
    @decision = @participant.decision
  end

  def gather
    @partial = "gather"
    @option = Option.new
    @comment = Comment.new
    @fact = Fact.new
  end

  def rate
    if @participant.next_fact
      rate_facts
    elsif @participant.next_feeling
      rate_feelings
    else
      @participant.admin? ? decide : pending
    end
  end

  def decide
    @partial = "decide"
    @options = @decision.options.sort_by(&:rating).reverse
  end

  def rate_facts
    @fact_rating = @participant.next_fact
    @assignment_ratings = @participant.assignment_ratings.select { |x| x.assignment.fact.id == @fact_rating.fact.id }
    @partial = "rate"
  end

  def rate_feelings
    @feeling = @participant.next_feeling
    @partial = "feel"
  end

  # Refactor me!
  def pending
    @options = @decision.options.sort_by { |option| option.rating(@participant) }.reverse
    @feelings = @participant.feelings.limit(3)
    init_feelings
    @partial = "pending"
  end

  def init_feelings
    @first = read_feeling(0)
    @second = read_feeling(1)
    @third = read_feeling(2)
  end

  def read_feeling(number)
    @options[number].feelings.find_by(participant: @participant) unless @options[number].nil?
  end

  def closed
    @partial = "closed"
    @option = Option.find(@decision.selected_id)
  end
end
