class DocumentPartHeading < DocumentPart

  def toTex
    "\\chapter{@content}"
  end
end
