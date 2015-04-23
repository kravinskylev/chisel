require "minitest/autorun"
require "minitest/pride"
require "../lib/lists"

class ListsTest < Minitest::Test
  def test_it_exist
    list = Lists.new("markdown")
    assert list
  end

  def test_it_makes_unordered_lists_of_two
    list = Lists.new("* Sushi\n* Barbeque\n")
    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n\n</ul>\n", list.to_ulist
  end

  def test_it_makes_unordered_lists_of_three
    list = Lists.new("* Sushi\n* Barbeque\n* Mexican\n")
    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n\n</ul>\n", list.to_ulist
  end

  def test_it_replaces_ordered_lists_of_two
    list = Lists.new("1. Sushi\n2. Barbeque\n")
    assert_equal "<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n</ol>", list.to_olist
  end

  def test_it_replaces_ordered_lists_of_three
    list = Lists.new("1. Sushi\n2. Barbeque\n3. Mexican\n")
    assert_equal "<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ol>", list.to_olist
  end
end
