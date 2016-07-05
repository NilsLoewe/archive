class StaticPagesController < ApplicationController

  def home
  end

  def search
    @decisions = Decision.all
    @documents = Document.all
  end

end
