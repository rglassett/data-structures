require "fiber"

module FakeEnumerable
  def inject(method_or_memo = nil, &prc)
    case method_or_memo
    when Symbol
      inject { |m, e| m.send(method_or_memo, e) }
    else
      return FakeEnumerator.new(self, :inject) unless block_given?
      accumulator = method_or_memo
      each do |el|
        if accumulator
          accumulator = prc.call(accumulator, el)
        else
          accumulator = el
        end
      end

      accumulator
    end
  end

  def map(&prc)
    return FakeEnumerator.new(self, :map) unless block_given?
    mapped = []

    each { |el| mapped << prc.call(el) }

    mapped
  end

  def select(&prc)
    return FakeEnumerator.new(self, :select) unless block_given?
    selected = []

    each { |el| selected << el if prc.call(el) }

    selected
  end

  def sort_by(&prc)
    return FakeEnumerator.new(self, :sort_by) unless block_given?
    sorted_tuples = map { |el| [prc.call(el), el] }.sort
    sorted_tuples.map { |el| el[1] }
  end
end

class FakeEnumerator
  include FakeEnumerable

  def initialize(enumerable, method)
    @enumerable = enumerable
    @method = method
  end

  def each(&prc)
    @enumerable.send(@method, &prc)
  end

  def next
    @fiber ||= Fiber.new do
      each { |e| Fiber.yield(e) }

      raise StopIteration
    end

    if @fiber.alive?
      @fiber.resume
    else
      raise StopIteration
    end
  end

  def with_index(&prc)
    i = 0
    each do |el|
      out = prc.call(el, i)
      i += 1
      out
    end
  end

  def rewind
    @fiber = nil
  end
end

class SortedList
  include FakeEnumerable

  def initialize
    @data = []
  end

  def <<(new_element)
    @data << new_element
    @data.sort!

    self
  end

  def each
    if block_given?
      @data.each { |e| yield(e) }
    else
      FakeEnumerator.new(self, :each)
    end
  end
end
