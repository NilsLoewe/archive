class PagesController < ApplicationController
  layout 'landingpage'
  before_filter :authenticate, only: [:admin]

  def index
    @decision = Decision.new
    @decision.build_admin
  end

  def imprint
  end

  def privacy
  end

  def admin
  end

  protected

  def authenticate
    return unless Rails.env.production?
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['PROOFLER_ADMIN_USERNAME'] && password == ENV['PROOFLER_ADMIN_SECRET']
    end
  end
end
