class DocumentPartParagraphsController < DocumentPartsController

  def update 
    @document_part_paragraph = current_document.document_parts.find(params[:id])
    if @document_part_paragraph.update_attributes(params[:document_part_paragraph])
      flash[:success] = "Paragraph updated"
    end    
    redirect_to current_document
  end

end
