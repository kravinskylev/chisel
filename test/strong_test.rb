require "minitest/autorun"
require "minitest/pride"
require "../lib/strong"

class StrongTest < Minitest::Test
  def test_it_exists
    m = Strong.new("**markdown**")
    assert m
  end

  def test_it_replaces_asterisk_to_emphasis
    m = Strong.new("**markdown**")
    assert_equal "<strong>markdown</strong>", m.to_strong
  end

  def test_it_does_not_replace_one_asterisk_to_strong
    s = Strong.new("*markdown*")
    assert_equal "*markdown*", s.to_strong
  end

  def test_it_replaces_only_asterisks_in_a_row
    m = Strong.new("My *emphasized and **stronged** text* is awesome.")
    assert_equal "My *emphasized and <strong>stronged</strong> text* is awesome.", m.to_strong
  end
end
