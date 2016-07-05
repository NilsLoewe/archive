configure :exchange => :pdf do
  queue   :pdf_create, :key => 'pdf.create'
  handler :pdf_create, PdfCreateHandler
end
