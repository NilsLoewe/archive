class ObjectivesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_objective, :only => [:destroy, :show, :update, :edit, :plan, :finish]

  def create
    session[:return_to] = request.referer
    @objective = current_user.objectives.build(params[:objective])

    if @objective.save
      flash[:success] = "Objective added"
    else
      flash[:success] = "Error"
    end
    redirect_to session[:return_to]
  end

  def destroy
    @objective.destroy
    redirect_to categories_path
  end

  def show
    session[:objective_id] = @objective.id
    @new_task = Task.new
  end

  def edit
    session[:return_to] = request.referer
  end

  def update
    session[:objective_id] = @objective.id
    session[:return_to] ||= request.referer
    if @objective.update_attributes(params[:objective])
      respond_to do |format|
        format.html do
          if @objective.sprint_running?
            @objective.update_sprint_end
          end
          redirect_to session[:return_to]
        end
        format.json { render :json => @objective }
      end
    end
    session[:return_to] = nil
  end

  def plan
    @objective.finish_sprint!
    redirect_to :back
  end

  def finish
    @objective.sprint_finished!
    redirect_to :back
  end

  private

    def load_objective
      @objective = Objective.find(params[:id])
    end
end
