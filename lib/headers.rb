class Headers
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def hash_counter
    markdown.count("#")
  end

  def to_header
    if hash_counter == 0
      @markdown
    elsif hash_counter == 1
      @markdown.gsub(/^# (.*)/,"<h1>\\1</h1>") << "\n"
    elsif hash_counter == 2
      @markdown.gsub(/^## (.*)/,"<h2>\\1</h2>") << "\n"
    elsif hash_counter == 3
      @markdown.gsub(/^### (.*)/,"<h3>\\1</h3>") << "\n"
    elsif hash_counter == 4
      @markdown.gsub(/^#### (.*)/,"<h4>\\1</h4>") << "\n"
    elsif hash_counter == 5
      @markdown.gsub(/^##### (.*)/,"<h5>\\1</h5>") << "\n"
    end
  end
end


# m = HashParser.new("# markdown")
# p m.hash_to_header
