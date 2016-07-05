class Api::HatsController < Api::BaseController

  before_action :check_owner, only: [:show, :update, :destroy]

  def index
    render json: current_user.hats
  end

  def show
    render json: hat
  end

  def create
    hat = current_user.hats.create!(safe_params)
    render json: hat
  end

  def update
    hat.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    hat.destroy
    render nothing: true
  end

  private

    def check_owner
      permission_denied if current_user != hat.user
    end

    def hat
      @hat ||= Hat.find(params[:id])
    end

    def safe_params
      params.require(:hat).permit(:title, :description)
    end

end
