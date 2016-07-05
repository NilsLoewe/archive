class DocumentTemplatesController < ApplicationController

  def index
    @document_templates = DocumentTemplate.all
  end
  
  def show
    @document_template = DocumentTemplate.find(params[:id])
  end
    
  def new
    @document_template = DocumentTemplate.new
  end
  
  def create
    @document_template = DocumentTemplate.new(params[:document_template])
    if @document_template.save
      flash[:success] = "Template created"
      redirect_to @document_template
    else
      render 'new'
    end
  end

   
end
