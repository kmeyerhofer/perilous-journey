require_relative 'node.rb'
require 'pry'
class LinkedList
  attr_accessor :head, :count, :append

  def initialize
    @head = head
  end

  def append(surname, supplies)
    if @head == nil
      node = Node.new(surname, supplies)
      @head = node
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(surname, supplies)
    end
  end

  def count
    current = @head
    counter = 0

    while current != nil
      counter += 1
      current = current.next_node
    end
    counter
  end

  def to_string
    name_array = []
    counter = 0
    if @head == nil
      "No value"
    else
      current = @head
      while current != nil && counter < 1
        counter += 1
        name_array.push("The #{current.surname} family")
        current = current.next_node
      end
      while current != nil && counter >= 1
        counter += 1
        name_array.push(", followed by the #{current.surname} family")
        current = current.next_node
      end
      name_array.inject {|string, n| string + n}
    end
  end

  def prepend(surname, supplies)
    node = Node.new(surname, supplies)
    node.next_node = @head
    @head = node
  end

  def insert(position, surname, supplies)
    counter = 0
    previous_node = nil
    current = @head
    node = Node.new(surname, supplies)
    while current != nil && counter != position - 1
      counter += 1
      current = current.next_node
    end
    if current != nil && counter == position - 1
      counter += 1
      previous_node = current
      node.next_node = current.next_node
      previous_node.next_node = node
    end
  end

  def includes?(inc)
    current = @head
    while current != nil && current.surname != inc
      current = current.next_node
    end
    if current == nil
      false
    else
      true
    end
  end

  def find(x, y)
    find_array = []
    counter = 0
    counter_two = 1
    if @head == nil
      "No value"
    else
      current = @head
      while current != nil && counter != x
        counter += 1
        current = current.next_node
      end
      while current != nil && counter == x
        counter += 1
        find_array.push("The #{current.surname} family")
        current = current.next_node
      end
      while current != nil && counter_two < y
        counter_two += 1
        find_array.push(", followed by the #{current.surname} family")
        current = current.next_node
      end
      find_array.inject {|string, n| string + n}
    end
  end

  def pop
    current = @head
    count
    counter = 1
    while current != nil && counter != count - 1
      counter += 1
      current = current.next_node
    end
    puts "The #{current.next_node.surname} family has died of dysentery"
    node = current.next_node
    current.next_node = nil
    node
  end

  def supplies
    summed_hash = {}
    current = @head
    while current != nil
      current_hash = current.supplies
      current_hash.each do |key, value|
        if summed_hash.has_key?(key)
          summed_hash[key] += value
        else
          summed_hash.store(key, value)
        end
      end
      current = current.next_node
    end
    summed_hash
  end
end
