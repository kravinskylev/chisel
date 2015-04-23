class Paragraphs
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def to_paragraph
    if not_a_paragraph?
      markdown
    else
      "<p>\n" + markdown + "\n</p>\n"
    end
  end

  def not_a_paragraph?
    markdown.start_with?("#", "*", ">") || markdown[0].to_i > 0
  end
end
