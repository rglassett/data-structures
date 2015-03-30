require_relative 'double_link'

class SentinelLink < DoubleLink
  def initialize(side)
    raise "wrong side" unless [:first, :last].include?(side)
    @side = side
  end

  def key
    raise "sentinels don't have keys!"
  end

  def key=
    raise "sentinels don't have keys!"
  end

  def prev=(link)
    if @side == :last
      return super(link)
    elsif link.nil?
      # Keep the left of the first link empty
    else
      raise "can't insert left of the first link"
    end
  end

  def next=(link)
    if @side == :first
      return super(link)
    elsif link.nil?
      # Keep the right of the last link empty
    else
      raise "can't insert right of the last link"
    end
  end

  def value
    raise "sentinels don't have values!"
  end

  def value=
    raise "sentinels don't have values!"
  end

  def remove
    raise "sentinels can't be removed!"
  end

  def inspect
    "SentinelLink"
  end
end

