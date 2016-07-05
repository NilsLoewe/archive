class GutsController < ApplicationController
  before_action :set_gut, only: [:show, :edit, :update, :destroy]

  def update
    @gut.update(gut_params)
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gut
      @gut = Gut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gut_params
      params.require(:gut).permit(:value, :unset)
    end
end
