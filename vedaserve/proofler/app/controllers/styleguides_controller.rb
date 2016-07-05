class StyleguidesController < ApplicationController
  def show
    @token = SecureRandom.urlsafe_base64(16)
    @option = Option.new(id: 23, title: 'An option', link: 'foo')

    # for the header partial
    @decision = Decision.new(title: 'title', id: 23)
  end
end
