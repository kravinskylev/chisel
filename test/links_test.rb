require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/links"

class LinksTest < Minitest::Test

  def test_it_converts_link
    m = Links.new("[This link](http://example.net/)")
    assert_equal "<a href=\"http://example.net/\">This link</a>", m.to_link
  end
end
