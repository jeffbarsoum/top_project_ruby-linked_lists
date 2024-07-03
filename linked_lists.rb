class LinkedList
  # setters and getters for first and last node in the list
  attr_accessor :head

  def initialize value
    prepend(value)
  end

  def tail
    next_pointer = self.head
    while next_pointer do
      return next_pointer unless next_pointer.next_node
      next_pointer = next_pointer.next_node
    end
    next_pointer
  end

  # adds a new node containing value to the end of the list
  def append(value)
    new_tail = Node.new(value)
    old_tail = self.tail
    old_tail.next_node = new_tail
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    new_node = Node.new(value, self.head)
    self.head = new_node
  end

  # returns the total number of nodes in the list
  def size
    cnt = 0
    next_pointer = self.head
    while next_pointer do
      cnt += 1
      next_pointer = next_pointer.next_node
    end
    cnt
  end

  # returns the node at the given index
  def at(index)
    pointer = self.head
    index.times do |i|
      pointer = pointer.next_node
    end
    pointer
  end

  # removes the last element from the list
  def pop
    old_tail = self.tail
    at(size - 2).next_node = nil
    old_tail
  end

  # removes the first element from the list
  def shift
    old_head = self.head
    self.head = at(1)
    old_head.next_node = nil
    old_head
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    return true if find(value)
    false
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    self.size.times do |i|
      return i if at(i).value == value
    end
    return false
  end

  # represent your LinkedList objects as strings,
  # so you can print them out and preview them in the console.
  #
  # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    str = ""
    self.size.times do |i|
      str += "( #{at(i)} )"
      str += " -> "
    end
    str += "nil"
    str
  end

  ####################
  # Extra Credit
  ####################

  # inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    return prepend(value) if index == 0
    at(index - 1).next_node = Node.new(value, at(index))
  end

  # removes the node at the given index
  def remove_at(index)
    return false unless at(index)
    prior_obj = at(index - 1)
    next_obj = at(index + 1)
    prior_obj.next_node = next_obj if prior_obj && next_obj
    return shift unless prior_obj
    return pop unless next_obj
    at(index)
  end

end

class Node
  # setters and getters for "value" and "next_node"
  attr_accessor :value, :next_node

  def initialize val, nxt_nd = nil
    self.value = val
    self.next_node = nxt_nd
  end

  def to_s
    value.to_s
  end

end

##################
# Testing
##################

list = LinkedList.new("apple")
puts list
puts "at(0): #{list.at(0).value}"
# puts "at(1): #{at(1).value}"
list.append("pear")
puts list
list.prepend("algae")
puts list
list.insert_at("orange", 3)
puts list
list.append("zebra")
puts list
list.remove_at(list.size - 1)
puts list
puts "\n\nCounts:"
puts "size: #{list.size}"
puts "find pear (true): #{list.find("pear")}"
puts "find zebra (false): #{list.find("zebra")}"
puts "contains pear (true): #{list.contains?("pear")}"
puts "contains zebra (false): #{list.contains?("zebra")}"
