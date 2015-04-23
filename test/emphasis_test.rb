require "minitest/autorun"
require "minitest/pride"
require "../lib/emphasis"

class EmphasisTest < Minitest::Test
  def test_it_exists
    m = Emphasis.new("markdown")
    assert m
  end

  def test_it_replaces_asterix_to_emphasis
    m = Emphasis.new("*markdown*")
    assert_equal "<em>markdown</em>", m.to_emphasis
  end


  def test_it_ignores_double_asterix
    m = Emphasis.new("My *emphasized and **stronged** text* is awesome.")
    assert_equal "My <em>emphasized and **stronged** text</em> is awesome.", m.to_emphasis
  end
end
