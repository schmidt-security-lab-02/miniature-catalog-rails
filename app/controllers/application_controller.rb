require "digest"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_editor!, except: [:index, :show]

  private

  def authenticate_editor!
    name = ENV["CATALOG_EDITOR_USER"].to_s
    password = ENV["CATALOG_EDITOR_PASSWORD"].to_s
    if name.blank? || password.blank?
      render plain: "The application owner must enable editing through the environment settings.", status: :service_unavailable
      return
    end
    authenticate_or_request_with_http_basic("Miniature catalog") do |given_name, given_password|
      valid_name = ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(name), Digest::SHA256.hexdigest(given_name.to_s))
      valid_password = ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(password), Digest::SHA256.hexdigest(given_password.to_s))
      valid_name & valid_password
    end
  end
end
