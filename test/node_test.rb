require 'minitest/autorun'
require './lib/node'
require './lib/linked_list'
require './lib/wagon_train'

class NodeTest < Minitest::Test

  def test_node
    node = Node.new("Burke", {"pounds of food" => 200})
    assert_equal "Burke", node.surname
  end

  def test_next
    node = Node.new("Burken", {"pounds of food" => 200})
    assert_nil node.next_node
  end

  def test_linked_list_head
    list = LinkedList.new
    assert_nil list.head
  end

  def test_linked_list_append
    list = LinkedList.new
    new_node = list.append("Rhodes", {"pounds of food" => 200})
    assert_equal "Rhodes", new_node.surname
    assert_equal Node, new_node.class
  end

  def test_count
    list = LinkedList.new
    list.append("Donaldson", {"pounds of food" => 200})
    assert_equal 1, list.count
  end

  def test_linked_list_to_string
    list = LinkedList.new
    list.append("Roberts", {"pounds of food" => 200})
    list.append("Juggle", {"pounds of food" => 200})
    list.append("Franz", {"pounds of food" => 200})
    assert_equal "The Roberts family, followed by the Juggle family, followed by the Franz family", list.to_string
  end

  def test_additional_append
    list = LinkedList.new
    list.append("Raul", {"pounds of food" => 200})
    list.append("Johnstone", {"pounds of food" => 200})
    list.append("Know", {"pounds of food" => 200})
    assert_equal "Know", list.head.next_node.next_node.surname
    assert_equal 3, list.count
  end

  def test_prepend_and_insert
    list = LinkedList.new
    list.append("Brooks", {"pounds of food" => 200})
    list.append("Henderson", {"pounds of food" => 200})
    list.prepend("McKinney", {"pounds of food" => 200})
    list.insert(1, "Lawson", {"pounds of food" => 200})
    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
  end

  def test_prepend_and_insert_two
    list = LinkedList.new
    list.append("Marshall", {"pounds of food" => 200})
    list.append("Jackson", {"pounds of food" => 200})
    list.append("Harrison", {"pounds of food" => 200})
    list.prepend("Roberts", {"pounds of food" => 200})
    list.insert(3, "Rupert", {"pounds of food" => 200})
    assert_equal 5, list.count
    assert_equal "The Roberts family, followed by the Marshall family, followed by the Jackson family, followed by the Rupert family, followed by the Harrison family", list.to_string
  end

  def test_includes?
    list = LinkedList.new
    list.append("Chapman", {"pounds of food" => 200})
    list.append("Brooks", {"pounds of food" => 200})
    list.includes?("Brooks")
    assert list.includes?("Brooks")
    refute list.includes?("Chappyman")
  end

  def test_find
    list = LinkedList.new
    list.append("Marshall", {"pounds of food" => 200})
    list.append("Harrison", {"pounds of food" => 200})
    list.append("Rummage", {"pounds of food" => 200})
    list.append("Sally", {"pounds of food" => 200})
    list.append("Reynolds", {"pounds of food" => 200})
    assert_equal "The Harrison family", list.find(1, 1)
  end

  def test_pop
    list = LinkedList.new
    list.append("Marshall", {"pounds of food" => 200})
    list.append("Harrison", {"pounds of food" => 200})
    list.append("Sally", {"pounds of food" => 200})
    list.append("Reynolds", {"pounds of food" => 200})
    assert_equal "Reynolds", list.pop.surname
  end

  def test_supplies
    list = WagonTrain.new
    list.append("Roger", {"pounds of food" => 200})
    list.append("Josh", {"pounds of food" => 200})
    list.append("Scraping", {"spare wagon tongues" => 3})
    assert_equal ({"pounds of food" => 400, "spare wagon tongues" => 3}), list.supplies
  end

  def test_go_hunting
    list = WagonTrain.new
    list.append("Burke", {"pounds of food" => 200})
    assert_equal ({"pounds of food" => 306}), wt.supplies
  end

end
