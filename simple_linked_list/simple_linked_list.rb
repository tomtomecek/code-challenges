class Element
  attr_reader :datum, :next

  def initialize(datum, _next = nil)
    @datum = datum
    @next  = _next
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def self.from_a(array)
    list = new
    array&.reverse_each do |el|
      list.push el
    end
    list
  end

  def to_a
    array = []
    return array if empty?
    current = head
    while current
      array.push current.datum
      current = current.next
    end
    array
  end

  def size
    number = 0
    return number if empty?
    current = head
    while current
      number += 1
      current = current.next
    end
    number
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    @head = Element.new(datum, head)
  end

  def peek
    head&.datum
  end

  def pop
    datum = peek
    @head = head.next
    datum
  end

  def reverse
    new_list = SimpleLinkedList.new
    new_list.push pop until empty?
    new_list
  end 
end
