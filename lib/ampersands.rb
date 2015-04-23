class Ampersands
  attr_reader :markdown
  def initialize(markdown)
    @markdown = markdown
  end

  def to_amp
    markdown.gsub(/&/, '&amp;')
  end
end
