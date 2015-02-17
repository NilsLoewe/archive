class WeeksController < ApplicationController

  before_filter :authenticate_user!

  def week_plan
    @objectives = current_user.objectives
    @periodics  = current_user.periodics
  end

  def current_week
    @objectives = current_user.objectives
    @periodics  = current_user.periodics
  end

  def finish_week
    current_user.objectives.each do |objective|
      objective.tasks.each do |task|
        task.no_week!
      end
    end
    current_user.periodics.each do |p|
      p.tasks.each do |task|
        task.no_week!
      end
    end
    current_user.start_week
    redirect_to :back
  end

end
