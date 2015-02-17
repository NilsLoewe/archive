class TasksController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_task, :only => [:destroy, :show, :update, :edit, :this_week, :no_week]

  def create
    @objective = Objective.find(params[:task][:plan_id])
    @task = @objective.tasks.build(params[:task])
    if @task.save
      flash[:success] = "task added"
    else
      flash[:success] = "Error"
    end
    redirect_to :back
  end

  def update
    session[:return_to] ||= request.referer
    @task.update_attributes(params[:task])
    redirect_to session[:return_to]
    session[:return_to] = nil
  end

  def destroy
    @task.destroy
    redirect_to :back
  end

  def show
  end

  def edit
    session[:return_to] = request.referer
  end

  def this_week
    @task.week!
    redirect_to :back
  end

  def no_week
    @task.no_week!
    redirect_to :back
  end

  private

    def load_task
      @task = Task.find(params[:id])
    end
end
