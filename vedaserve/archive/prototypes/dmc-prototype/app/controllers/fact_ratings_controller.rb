class FactRatingsController < ApplicationController
  before_action :set_fact_rating, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    if @fact_rating.update(fact_rating_params)
      redirect_to :back
    end
  end

  def destroy
    @fact_rating.destroy
    redirect_to :back
  end

  private
    def set_fact_rating
      @fact_rating = FactRating.find(params[:id])
    end

    def fact_rating_params
      params.require(:fact_rating).permit(:fact_rating, :fact_id, :value, :unset)
    end
end
