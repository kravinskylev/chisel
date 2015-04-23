class Strong
  attr_reader :markdown
  def initialize(markdown)
    @markdown = markdown
  end

  def to_strong
    @markdown.gsub(/\*\*(.*)\*\*/,"<strong>\\1</strong>")
  end
end

