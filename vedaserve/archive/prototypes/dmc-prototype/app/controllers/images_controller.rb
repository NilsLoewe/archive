class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

def create
  @image = Image.new(image_params)
  @image.save
  redirect_to :back
end

def update
  @image.update(image_params)
  redirect_to :back
end

def destroy
  @image.destroy
  redirect_to :back
end

private

  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:option_id, :file)
  end

end
