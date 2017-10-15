require_relative 'linked_list.rb'
class Node
  attr_accessor :surname, :next_node, :supplies

  def initialize(surname, supplies)
    @surname = surname
    @next_node = next_node
    @supplies = supplies
  end

end
