require "minitest/autorun"
require "minitest/pride"
require "../lib/paragraphs"

class ParagraphsTest < Minitest::Test
  def test_it_exist
    paragraph = Paragraphs.new("markdown")
    assert paragraph
  end

  def test_it_returns_string
    paragraph = Paragraphs.new("markdown")
    assert_equal "<p>\nmarkdown\n</p>\n", paragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_it_starts_with_a_hash
    paragraph = Paragraphs.new("#markdown")
    assert_equal "#markdown", paragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_it_starts_with_two_hashes
    paragraph = Paragraphs.new("##markdown")
    assert_equal "##markdown", paragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_it_starts_with_five_hashes
    paragraph = Paragraphs.new("#####markdown")
    assert_equal "#####markdown", paragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_starts_with_asterix
    paragraph = Paragraphs.new("*markdown")
    assert_equal "*markdown", paragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_starts_with_integer
    paragraph = Paragraphs.new("1. markdown")
    assert_equal "1. markdown", paragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_it_starts_with_greater_than
    paragraph = Paragraphs.new("> markdown")
    assert_equal "> markdown", paragraph.to_paragraph
  end
end
