# Intentionally unsafe example for comparing CodeQL configuration scopes.
# This controller has no route and must not be connected to the application.
# SQL values in real application code must use bound parameters.
module SecurityLab
  class UnsafeMiniatureLookup < ActionController::Base
    def show
      requested_name = params[:name]
      matches = Miniature.where("name = '#{requested_name}'")
      render json: matches
    end
  end
end
