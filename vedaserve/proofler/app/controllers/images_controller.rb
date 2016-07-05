class ImagesController < ApplicationController
  respond_to :html, :json

  before_filter :load_decision, only: [:create, :update, :destroy]

  def new
    @image = Image.new
    respond_modal_with @image
  end

  def create
    if params[:image][:file] != "/files/original/missing.png"
      create_image
    else
      redirect_to dashboard_path(token: @token)
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to dashboard_path(token: @token)
  end

  private

  def load_decision
    @token = params[:dashboard_token]
    @participant = Participant.find_by(invitation_token: @token)
    @decision = @participant.decision
  end

  def image_params
    params.require(:image).permit(:title, :option_id, :file)
  end

  def create_image
    @option = Option.find(params[:image][:option_id])
    @image = @option.images.create(image_params)
    @image.save!
    respond_modal_with @image, location: dashboard_path(token: @token)
  end
end
