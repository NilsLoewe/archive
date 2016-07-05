class FactAssetsController < ApplicationController
  before_action :set_fact_asset, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @fact_asset = FactAsset.new
  end

  def edit
  end

  def create
    @fact_asset = FactAsset.new(fact_asset_params)
    @fact_asset.save
    redirect_to :back
  end

  def update
    if @fact_asset.update(fact_asset_params)
      redirect_to :back
    end
  end

  def destroy
    @fact_asset.destroy
    redirect_to :back
  end

  private
    def set_fact_asset
      @fact_asset = FactAsset.find(params[:id])
    end

    def fact_asset_params
      params.require(:fact_asset).permit(:fact_asset, :fact_id, :title, :description)
    end
end
