require "spec_helper"
require "./lib/good_pack"
require "./lib/receipt"

describe Receipt do
  [:total, :tax].each do |method|
    describe "##{method} returns sum of all goods #{method}" do
      it "for one good" do
	goods = [GoodPack.new(1, "book", 12.49)]
	expect(Receipt.new(goods).send(method)).to eq \
	  goods.map(&method).inject(:+)
      end

      it "for multiple goods" do
	goods = [GoodPack.new(1, "book", 12.49),
	  GoodPack.new(1, "chocolate bar", 0.85)]
	expect(Receipt.new(goods).send(method)).to eq \
	  goods.map(&method).inject(:+)
      end
    end
  end
end
