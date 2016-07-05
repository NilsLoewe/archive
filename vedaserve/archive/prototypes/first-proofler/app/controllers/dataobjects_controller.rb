class DataobjectsController < ApplicationController

  before_action :set_dataobject, only: [:show, :update, :destroy]
  before_action :load_search, only: [:create]

  def show
    session[:dataobject_id] = params[:id]
    redirect_to :back
  end

  def create
    @dataobject = @search.dataobjects.build(params[:dataobject])
    @dataobject.title = @dataobject.content unless @dataobject.title?
    if @dataobject.save
      flash[:success] = "Object added"
      session[:dataobject_id] = @dataobject.id
    else
      flash[:success] = "Error"
    end
    redirect_to :back
  end

  def update
    @dataobject = Dataobject.find(params[:id])
    @dataobject.update_attributes(params[:dataobject])
    redirect_to :back
  end

  def destroy
    @dataobject.destroy
    redirect_to :back
  end

  private

    def load_search
      @search = Search.find(params[:dataobject][:search_id])
    end

    def set_type
      @type = type
    end

    def dataobject
      params[:type] || "Dataobject"
    end

    def dataobject_class
      dataobject.constantize
    end

    def set_dataobject
      @dataobject = dataobject_class.find(params[:id])
    end

    def dataobject_params
      params.require(type.downcase.to_sym).permit(:title, :type, :content)
    end
end
