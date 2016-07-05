class StaticPagesController < ApplicationController

  def admin
  end

  def home
    @new_research = Research.create(title: "")  if user_signed_in?
    @researches = current_user.researches if user_signed_in?
  end

  def help
  end

  def about
  end
end
