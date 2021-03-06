require 'rspec'
require 'sentinel_link'

describe SentinelLink do
  let(:left_sentinel) { SentinelLink.new(:first) }
  let(:right_sentinel) { SentinelLink.new(:last) }
  let(:link) { DoubleLink.new("hello") }

  it "does not have a #value getter or setter" do
    expect { left_sentinel.value }.to raise_error
    expect { left_sentinel.value = "hello" }.to raise_error
  end

  describe "#next=" do
    it "raises an error from the last sentinel link" do
      expect { left_sentinel.next = link }.not_to raise_error
      expect { right_sentinel.next = link }.to raise_error
    end
  end

  describe "#prev=" do
    it "raises an error from the first sentinel link" do
      expect { right_sentinel.prev = link }.not_to raise_error
      expect { left_sentinel.prev = link }.to raise_error
    end
  end
end
