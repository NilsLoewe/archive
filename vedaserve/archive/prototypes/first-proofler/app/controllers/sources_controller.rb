class SourcesController < ApplicationController

  def index
    @sources = Source.all
    @new_source = Source.new
  end

  def show
    redirect_to :back
  end

  def create
    @source = Source.new(params[:source])
    if @source.save
      flash[:success] = "Source added"
    else
      flash[:success] = "Error"
    end

    redirect_to :back
  end
  
  def update
    @source = Source.find(params[:id])
    @source.update_attributes(params[:source])
    redirect_to :back
  end

  private

    def source_params
      params.require(:source).permit(:title)
    end

end
