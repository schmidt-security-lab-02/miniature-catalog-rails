# Remediated examples from the CodeQL configuration scope demonstration.
# This controller remains isolated and has no application route.
module SecurityLab
  class UnsafeMiniatureLookup < ActionController::Base
    def show
      requested_name = params[:name].to_s
      matches = Miniature.where(name: requested_name)
      render json: matches
    end

    # Escape untrusted text before rendering it in an HTML response.
    def preview
      render html: ERB::Util.html_escape(params[:description].to_s)
    end
  end
end
