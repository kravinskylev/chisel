class Lists
  attr_reader :markdown
  def initialize(markdown)
    @markdown = markdown
  end

  def to_ulist
    if markdown.start_with?("*")
    "<ul>\n" + markdown.gsub(/\* (.+)/,"<li>\\1</li>") + "\n</ul>\n"
    else
      markdown
    end
  end

  def to_olist
    if markdown[0].to_i > 0
    "<ol>\n" + markdown.gsub(/^\d+\. (.+)/,"<li>\\1</li>") + "</ol>"
    else
      markdown
    end
  end
end

