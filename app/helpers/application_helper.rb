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
  
  def include_javascripts_using_head_js
    render :partial => 'shared/includes'
  end
end
