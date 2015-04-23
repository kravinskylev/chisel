class Links
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def to_link
    if markdown[/\[.+\]\(.+\)/]
      '<a href="' + hyperlink + '">' + link_words + '</a>'
      end
  end

  def hyperlink
    replace_borders(/\((.+)\)/)
  end

  def link_words
    replace_borders(/\[(.+)\]/)
  end

  def replace_borders(reg)
    @markdown[reg][1...-1]
  end
end
