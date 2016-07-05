module SessionsHelper

  def current_document=(document)
    @current_document = document
  end
  
  def current_document
    @current_document ||= Document.find_by_hashtag(session[:document])
  end
  
end
