class PeriodicsController < ApplicationController

  before_filter :authenticate_user!

  def create
    session[:return_to] = request.referer
    @periodic = current_user.periodics.build(params[:periodic])

    if @periodic.save
      flash[:success] = "Aufgabe erstellt"
    else
      flash[:success] = "Error"
    end
    redirect_to session[:return_to]
  end

  def destroy
    @periodic = Periodic.find(params[:id])
    @periodic.destroy
    redirect_to categories_path
  end

  def edit
    session[:return_to] ||= request.referer
    @periodic = Periodic.find(params[:id])
  end

  def index
    @user = current_user
    @new_periodic = Periodic.new
  end

  def update
    @periodic = Periodic.find(params[:id])
    @periodic.update_attributes(params[:periodic])
    redirect_to session[:return_to]
  end

  def instanciate
    @periodic = Periodic.find(params[:id])
    @task = @periodic.tasks.build(title: @periodic.title, :current_week => true)
    if @task.save
      flash[:success] = "Aufgabe in der Woche eingeplant"
      @task.week!
    else
      flash[:success] = "Error"
    end
    redirect_to :back
  end

end
