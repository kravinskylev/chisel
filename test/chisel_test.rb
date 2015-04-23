require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/chisel"

class ChiselTest < Minitest::Test
  def test_it_exist
    markdown = ChiselParser.new("markdown")
    assert markdown
  end

  def test_it_splits_string
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal ["markdown\nhtml"], markdown.markdown
  end

  def test_it_makes_a_paragraph
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal "<p>\nmarkdown\nhtml\n</p>\n", markdown.to_html
  end

  def test_it_replaces_headers
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal "<p>\nmarkdown\nhtml\n</p>\n", markdown.to_html
  end

  def test_it_replaces_asterisx_to_emphasis
    markdown = ChiselParser.new("My *emphasized and stronged text* is awesome.")
    assert_equal "<p>\nMy <em>emphasized and stronged text</em> is awesome.\n</p>\n", markdown.to_html
  end

  def test_it_replaces_two_asterix_to_strong
    markdown = ChiselParser.new("My *emphasized and **stronged** text* is awesome.")
    assert_equal "<p>\nMy <em>emphasized and <strong>stronged</strong> text</em> is awesome.\n</p>\n", markdown.to_html
  end

  def test_it_replaces_amp_symbol
    markdown = ChiselParser.new("My *emphasized & **stronged** text* is awesome.")
    assert_equal "<p>\nMy <em>emphasized &amp; <strong>stronged</strong> text</em> is awesome.\n</p>\n", markdown.to_html
  end

  def test_it_replaces_unordered_lists
    markdown = ChiselParser.new("* Sushi\n* Barbecue\n* Mexican\n")
    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbecue</li>\n<li>Mexican</li>\n\n</ul>\n", markdown.to_html
  end

  def test_it_replaces_ordered_lists
    list = ChiselParser.new("1. Sushi\n2. Barbecue\n3. Mexican\n")
    assert_equal "<ol>\n<li>Sushi</li>\n<li>Barbecue</li>\n<li>Mexican</li>\n</ol>", list.to_html
  end
end

