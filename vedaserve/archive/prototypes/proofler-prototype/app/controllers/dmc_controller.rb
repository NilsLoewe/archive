class DmcController < ApplicationController
  layout 'dmc'

  def home
    @search = Search.new
  end

  def status
  end

end
