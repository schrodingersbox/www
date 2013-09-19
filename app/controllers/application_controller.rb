class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_split_cat_cookie

  before_filter :require_reports if Rails.env.development?

  def require_reports
    Dir[Rails.root + 'app/reports/**/*.rb'].each { |path| require_dependency path }
  end

end
