class DocumentPartsController < ApplicationController

  def create
    @document_part_heading = DocumentPartHeading.create(params[:document_part])
    @document_part_paragraph = DocumentPartParagraph.new
    current_document.document_parts << @document_part_heading
    current_document.document_parts << @document_part_paragraph
    if (@document_part_paragraph.save && @document_part_heading.save)
      flash[:success] = "Part created!"
      redirect_to current_document
    else
      render 'pages/home'
    end
  end
  
  def update 
    @document_part = current_document.document_parts.find(params[:id])
    if @document_part.update_attributes(params[:document_part])
      flash[:success] = "Part updated"
    end    
    redirect_to current_document
  end
  
  def destroy
  end
end
