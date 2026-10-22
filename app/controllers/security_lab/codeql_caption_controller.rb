module SecurityLab
  class CodeqlCaptionController < ApplicationController
    # Intentional CodeQL lab fixture: rb/reflected-xss (CWE-79).
    # No route is registered for this controller.
    # Fix after observation by escaping the caption before rendering HTML.
    def show
      caption = params[:caption].to_s
      render html: "<section><h1>#{caption}</h1></section>".html_safe
    end
  end
end
