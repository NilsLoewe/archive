class CategoriesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_category, :only => [:destroy, :show, :update, :edit, :up, :down]

  def create
    @user = current_user
    @category = @user.categories.build(params[:category])
    if @category.save
      flash[:success] = "Category added"
    else
      flash[:success] = "Error"
    end
    redirect_to @category
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def show
    @categories = current_user.categories
    @new_category  = Category.new
    @new_objective = Objective.new
    @new_periodic  = Periodic.new
  end

  def edit
  end

  def index
    @categories = current_user.categories
    @new_category  = Category.new
    @new_objective = Objective.new
    @new_periodic  = Periodic.new
  end

  def update
    if @category.update_attributes(params[:category])
      respond_to do |format|
        format.html { redirect_to categories_path}
        format.json { render :json => @category }
      end
    else
      respond_to do |format|
        format.html { redirect_to categories_path } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def up
    @category.move_higher
    redirect_to categories_path
  end

  def down
    @category.move_lower
    redirect_to categories_path
  end

  private

  def load_category
    @category = Category.find(params[:id])
  end
end
