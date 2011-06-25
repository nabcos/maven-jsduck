require 'java'

# fake RDiscount API to satisfy RDiscount dependency of jsduck.
# RDiscount uses C code by loading a .so file, which won't work in jruby and is not portable.
# replaces RDiscount with a pure ruby Markdown formatter.
class RDiscount
  def to_html()
    @markdown.markdown(@text)
  end

  def initialize(text)
    @text  = text
    @markdown = com.petebevin.markdown.MarkDownProcessor.new()
  end

end