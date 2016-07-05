class HintsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @hints = Hint.all
    @new_hint = Hint.new
  end

  def show
    redirect_to :back
  end

  def create
    @hint = Hint.new(params[:hint])

    if @hint.save
      flash[:success] = 'hint added'
    else
      flash[:success] = 'Error'
    end

    redirect_to :back
  end

  def update
    @hint = Hint.find(params[:id])
    @hint.update_attributes(params[:hint])
    redirect_to :back
  end

  private

    def hint_params
      params.require(:hint).permit(:title)
    end
end
