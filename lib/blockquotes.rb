class Blockquotes
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def to_block
    if markdown[0] == ">"
      markdown.delete(">")
      "<blockquote>\n" + markdown + "</blockquote>\n"
    else
      markdown
    end
  end
end
