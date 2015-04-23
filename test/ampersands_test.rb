require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/ampersands"

class AmpParserTest < Minitest::Test
  def test_it_replaces_to_amp
    m = Ampersands.new("& markdown")
    assert_equal "&amp; markdown", m.to_amp
  end

  def test_it_replaces_amp_at_end_of_line
    m = Ampersands.new("markdown &")
    assert_equal "markdown &amp;", m.to_amp
  end

  def test_it_replaces_amp_at_beginning_end_of_line
    m = Ampersands.new("& markdown &")
    assert_equal "&amp; markdown &amp;", m.to_amp
  end
end
