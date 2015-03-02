class Link
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
  end
end

class LinkedList
  attr_reader :first_link

  def initialize(link = nil)
    @first_link = link
  end

  def insert_after(link, new_link)
    new_link.next = link.next
    link.next = new_link
  end

  def insert_beginning(link)
    link.next = @first_link
    @first_link = link
  end

  def remove_after(link)
    if link.next
      link.next = link.next.next
    end
  end

  def remove_beginning
    @first_link = @first_link.next
  end
end
