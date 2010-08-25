class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :title
  def title(title = nil)
    @title = title if title
    @title
  end
  
  helper_method :render
  def render(code, args = {}, &block)
    return super unless code.is_a? Fixnum
    super(:"http/#{code}", args.merge(:status => code), &block)
  end
end
