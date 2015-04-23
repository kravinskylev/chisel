require_relative "paragraphs"
require_relative "headers"
require_relative "emphasis"
require_relative "strong"
require_relative "ampersands"
require_relative "lists"
require_relative "links"
require_relative "blockquotes"

class ChiselParser

  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown.split("\n\n")
  end

  def to_html
    chunks = markdown
    chunks = chunks.map {|line| Paragraphs.new(line).to_paragraph}
    chunks = chunks.map {|line| Headers.new(line).to_header}
    chunks = chunks.map {|line| Strong.new(line).to_strong}
    chunks = chunks.map {|line| Emphasis.new(line).to_emphasis}
    chunks = chunks.map {|line| Ampersands.new(line).to_amp}
    chunks = chunks.map {|line| Lists.new(line).to_ulist}
    chunks = chunks.map {|line| Lists.new(line).to_olist}
    chunks = chunks.map {|line| Blockquotes.new(line).to_block}
    chunks = chunks.map do |line|
      if match = line[/\[.+\]\(.+\)/]
        hyperlinked = Links.new(match).to_link
        line.gsub(match, hyperlinked)
      else
        line
      end
    end

    chunks.join("\n")
  end


end

File.write(ARGV[1], ChiselParser.new(File.read(ARGV[0])).to_html)
puts "Converted #{ARGV[0]} (#{File.read(ARGV[0]).count("\n")} lines) to #{ARGV[1]} (#{ChiselParser.new(File.read(ARGV[0])).to_html.count("<\n>")} lines)"



#   Easier to read file IO w variables
#   my_input  = ARGV[0]
#   my_output = ARGV[1]
#   markdown  = File.read(my_input)
#   html      = ChiselParser.new(markdown).to_html
#   File.write(my_output, html)
#   puts "Converted #{my_input} (#{markdown.count("\n")} lines) to #{my_output} (#{html.count("<\n>")} lines)"


