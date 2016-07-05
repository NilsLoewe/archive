class DocumentPartHeadingsController < DocumentPartsController

  def update 
    @document_part_heading = current_document.document_parts.find(params[:id])
    if @document_part_heading.update_attributes(params[:document_part_heading])
      flash[:success] = "Heading updated"
    end    
    redirect_to current_document
  end

end
