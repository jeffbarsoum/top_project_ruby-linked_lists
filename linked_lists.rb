class LinkedList
  # setters and getters for first and last node in the list
  attr_accessor :head, :tail

  def initialize value
    prepend(value)
  end

  # adds a new node containing value to the end of the list
  def append(value)
    new_node = self.tail = Node.new(value)
    self.tail.next_node = new_node
    self.tail = new_node
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    self.head = Node.new(value, self.head)
  end

  # returns the total number of nodes in the list
  def size
    cnt = self.head ? 1: 0
    next_pointer = self.head
    while next_pointer do
      if next_pointer.next_node
        next_pointer = next_pointer.next_node
        cnt += 1
      end
    end
    cnt
  end

  # returns the node at the given index
  def at(index)
    cnt = self.head ? 1 : 0
    next_pointer = self.head
    return self.head if index == 0
    while cnt < index do
      cnt += 1
      next_pointer = next_pointer.next_node
    end
  end

  # removes the last element from the list
  def pop
    result = at(size).value
    at(size - 1).next_node = nil
    result
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    next_pointer = self.head
    until is_contains do
      return true if next_pointer.value == value
      next_pointer = next_pointer.next_node
    end
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    self.size.times do |i|
      return at(i) if at(i).value == value
    end
  end

  # represent your LinkedList objects as strings,
  # so you can print them out and preview them in the console.
  #
  # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    str = ""
    self.size.times do |i|
      str += "( #{at(i).value} ) -> "
    end
  end

  ####################
  # Extra Credit
  ####################

  # inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    at(index - 1).next_node = Node.new(value, at(index))
  end

  # removes the node at the given index
  def remove_at(index)
    at(index - 1).next_node = at(index + 1)
  end

end

class Node
  # setters and getters for "value" and "next_node"
  attr_accessor :value, :next_node

  def initialize val, nxt_nd = nil
    self.value = val
    self.next_node = nxt_nd
  end

end

##################
# Testing
##################

list = LinkedList.new("apple")
list.append("pear")
list.prepend("algae")
list.insert_at("orange", 3)
list.append("zebra")
puts list
list.remove_at(list.size)
puts list
puts "\n\nCounts:"
puts "size: #{list.size}"
puts "find pear (true): #{list.find("pear")}"
puts "find zebra (false): #{list.find("zebra")}"
puts "contains pear (true): #{list.contains?("pear")}"
puts "contains zebra (false): #{list.contains?("zebra")}"

