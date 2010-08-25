class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def render(code, args = {}, &block)
      return super unless code.is_a? Fixnum
      super(:"http/#{code}", args.merge(:status => code), &block)
    end
end
