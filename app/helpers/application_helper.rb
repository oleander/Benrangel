module ApplicationHelper
  # Renders either the content in the first parameter (given with content_for)
  # or the partial that is sent as the +default+ parameter.
  #
  # @param Symbol symbol The symbol given to #content_for
  # @param Mixed default Argument given to “render” if there’s no content for +symbol+
  # @return String
  def yield_default(symbol, *default)
    content_for?(symbol) ? content_for(symbol) : render(*default)
  end
  
  # Clears the content at identifier +symbol+
  #
  # @param Symbol symbol
  # @return Previous content
  def content_clear(symbol)
    @_content_for.delete(symbol)
  end
  
  # Sets the content at +identifier+ to a NULL-byte (essentially empty, but not blank?)
  #
  # @param Symbol symbol
  # @return Previous content
  def empty_content_for(symbol)
    content = content_clear(symbol)
    content_for symbol, 0.chr
    return content
  end
  
  # Includes jQuery by CDN or local depending on environment
  #
  # @return String
  def include_jquery(version = '1.4.2')
    prefix = Rails.env.development?? 'dev/' : 'http://code.jquery.com/'
    javascript_include_tag [prefix, 'jquery-', version, '.min.js'].join
  end
end
