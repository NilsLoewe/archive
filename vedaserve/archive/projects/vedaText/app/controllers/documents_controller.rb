class DocumentsController < ApplicationController
  
  def index
    @documents = Document.all
  end
  
  def show
    @document = Document.find_by_hashtag(params[:id])
    session[:document] = @document.hashtag
    @document_parts = @document.document_parts
    @document_part = @document_parts.new
    @document_template = @document.document_template
  end
    
  def new
    @document_templates = DocumentTemplate.all
    @document = Document.new
  end
  
  def create
    @document = Document.new(params[:document])
    if @document.save
      session[:document] = @document.hashtag
      flash[:success] = "Document created"
      redirect_to @document
    else
      render 'new'
    end
  end
  
  def update 
    @document = Document.find_by_hashtag(params[:id])
    if @document.update_attributes(params[:document])
      flash[:success] = "Document updated"
    else
      flash[:error] = "Not updated!"
    end
    redirect_to @document
  end
  
  def pdftex
    document = Document.find_by_hashtag(params[:hashtag])
    Messenger.publish('pdf.create', document.hashtag, :exchange => :pdf)

    render :text => 'bar', :status => '201'
  end
  
  def destroy
  end
  
end
