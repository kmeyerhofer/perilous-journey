require_relative 'linked_list'

class WagonTrain
  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies)
    list.append(surname, supplies)
  end

  def count
    list.count
  end

  def supplies
    list.supplies
  end
end
