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

    # Intentionally unsafe: untrusted HTML must be escaped in real views.
    # This action has no route and exists only for the CodeQL demonstration.
    def preview
      render html: params[:description].to_s.html_safe
    end
  end
end
