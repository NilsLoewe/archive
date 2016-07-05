class OptionAssetsController < ApplicationController
  before_action :set_option_asset, only: [:show, :edit, :update, :destroy] 

  def index
  end

  def show
  end

  def new
    @option_asset = OptionAsset.new
  end

  def edit
  end

  def create
    @option_asset = OptionAsset.new(option_asset_params)
    @option_asset.save
    redirect_to :back
  end

  def update
    if @option_asset.update(option_asset_params)
      redirect_to :back
    end
  end

  def destroy
    @option_asset.destroy
    redirect_to :back
  end

  private
    def set_option_asset
      @option_asset = OptionAsset.find(params[:id])
    end

    def option_asset_params
      params.require(:option_asset).permit(:option_asset, :option_id, :title, :description)
    end

end
