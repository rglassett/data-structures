require 'rspec'
require 'enumerable'

describe "FakeEnumerable" do
  subject(:list) { SortedList.new }

  before(:each) do
    list << 3 << 13 << 42 << 4 << 7
  end

  it "supports map" do
    mapped_list = list.map { |x| x + 1 }

    expect(mapped_list).to eq([4, 5, 8, 14, 43])
  end

  it "supports sort_by" do
    sorted_list = list.sort_by { |x| x.to_s }

    expect(sorted_list).to eq([13, 3, 4, 42, 7])
  end

  it "supports select" do
    selected_list = list.select { |x| x.even? }

    expect(selected_list).to eq([4, 42])
  end

  it "supports inject" do
    expect(list.inject(:+)).to eq(69)
    expect(list.inject { |s, e| s + e }).to eq(69)
    expect(list.inject(-10) { |s, e| s + e }).to eq(59)
  end
end

describe "FakeEnumerator" do
  subject(:list) { SortedList.new }

  before(:each) do
    list << 3 << 13 << 42 << 4 << 7
  end

  it "supports next" do
    enum = list.each

    expect(enum.next).to eq(3)
    expect(enum.next).to eq(4)
    expect(enum.next).to eq(7)
    expect(enum.next).to eq(13)
    expect(enum.next).to eq(42)

    expect { enum.next }.to raise_error # StopIteration
  end

  it "supports rewind" do
    enum = list.each

    4.times { enum.next }
    enum.rewind

    2.times { enum.next }
    expect(enum.next).to eq(7)
  end

  it "supports with_index" do
    enum = list.map
    expected = ["0. 3", "1. 4", "2. 7", "3. 13", "4. 42"]

    expect(enum.with_index { |e, i| "#{i}. #{e}" }).to eq(expected)
  end
end
