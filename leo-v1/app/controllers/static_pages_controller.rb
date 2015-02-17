class StaticPagesController < ApplicationController

  before_filter :authenticate_user!, :only => [:life]

  def home
  end

  def life
    @categories = current_user.categories
  end

  def archive
    @categories = current_user.categories
  end

  def parked
    @categories = current_user.categories
  end

  def help
    @objectives = current_user.objectives
  end

  def about
  end
end
