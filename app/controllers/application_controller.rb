class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :title
  
  before_filter do
    I18n.locale = 'sv-SE'
  end
  # Get (and possibly set) the site title.
  #
  # @param [nil, #to_s] title (default: nil)
  # @return #to_s
  def title(title = nil)
    @title = title if title
    @title
  end
  
  # Renders a status code template (with the correct HTTP status code).
  #
  # @param Fixnum code
  # @param Hash args (default: {})
  # @return String
  def render_code(code, args = {}, &block)
    render :"http/#{code}", args.merge(:status => code), &block
  end
end
