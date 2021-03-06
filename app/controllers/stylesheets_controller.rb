class StylesheetsController < ApplicationController
  before_filter :set_headers
  skip_before_filter :login_required
  after_filter  { |c| c.cache_page }
  session :off
  layout nil

  private
  def set_headers
    headers['Content-Type'] = 'text/css; charset=utf-8'
  end
end