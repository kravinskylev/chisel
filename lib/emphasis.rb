class Emphasis
  attr_reader :markdown
  def initialize(markdown)
    @markdown = markdown
  end

  def to_emphasis
    @markdown.gsub(/\*(.+)\*/,"<em>\\1</em>")
  end

end


