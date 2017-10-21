require_relative 'node.rb'
require 'pry'
class LinkedList
  attr_accessor :head, :count, :append, :go_hunting

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

  def includes?(includes)
    current = @head
    while current != nil && current.surname != includes
      current = current.next_node
    end
    if current == nil
      false
    else
      true
    end
  end

  def find(position, length)
    find_array = []
    counter = 0
    counter_two = 1
    if @head == nil
      "No value"
    else
      current = @head
      while current != nil && counter != position
        counter += 1
        current = current.next_node
      end
      while current != nil && counter == position
        counter += 1
        find_array.push("The #{current.surname} family")
        current = current.next_node
      end
      while current != nil && counter_two < length
        counter_two += 1
        find_array.push(", followed by the #{current.surname} family")
        current = current.next_node
      end
      find_array.inject {|string, n| string + n}
    end
  end

  def pop
    current = @head
    counter = 1
    while current != nil && counter != count - 1
      counter += 1
      current = current.next_node
    end
    "The #{current.next_node.surname} family has died of dysentery"
    node = current.next_node
    current.next_node = nil
    node
  end

  def supplies(hunting = 0)
    summed_hash = {}
    current = @head
    hunting_counter = 0
    while current != nil
      current_hash = current.supplies
      current_hash.each do |key, value|
        if (summed_hash.has_key?("pounds of food") || current_hash.has_key?("pounds of food")) && key == "pounds of food" && hunting_counter < 1
          current_hash["pounds of food"] += hunting
          summed_hash.store(key, (value + hunting))
          hunting_counter += 1
        elsif summed_hash.has_key?(key)
          summed_hash[key] += value
        else
          summed_hash.store(key, value)
        end
      end
      current = current.next_node
    end
    summed_hash
  end

  def hunting_values
    {"bison" => 100, "deer" => 40, "squirrel" => 2}
  end

  def go_hunting
    num_of_animals = rand(0..5)
    if num_of_animals == 0
      "You got #{num_of_animals} squirrels, #{num_of_animals} deer, and #{num_of_animals} bison for #{num_of_animals} pounds of food."
    else
      animals = ["squirrel", "deer", "bison"]
      animal_selector = []
      num_of_animals.times do |animal_total|
        animal_selector.push(animals[(rand(0..2))])
      end
      animal_pounds = 0
      animal_selector.each do |animal_weight|
        animal_meat = hunting_values[animal_weight]
        animal_pounds += animal_meat
      end
      squirrel = 0
      deer = 0
      bison = 0
      animal_selector.each do |animals|
        if animals == "squirrel"
          squirrel += 1
        elsif animals == "deer"
          deer += 1
        elsif animals == "bison"
          bison += 1
        end
      end
      supplies(animal_pounds)
      "You got #{squirrel} squirrel#{"s" if squirrel > 1}, #{deer} deer, and #{bison} bison for #{animal_pounds} pounds of food"
    end
  end

end
