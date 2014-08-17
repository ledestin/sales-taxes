require "spec_helper"
require "./lib/item"
require "./lib/receipt"

describe ShoppingCart::Receipt do
  [:total, :tax].each do |method|
    describe "##{method} returns sum of all goods #{method}" do
      it "for one good" do
	goods = [ShoppingCart::Item.new(1, "book", 12.49)]
	expect(ShoppingCart::Receipt.new(goods).send(method)).to eq \
	  goods.map(&method).inject(:+)
      end

      it "for multiple goods" do
	goods = [ShoppingCart::Item.new(1, "book", 12.49),
	  ShoppingCart::Item.new(1, "chocolate bar", 0.85)]
	expect(ShoppingCart::Receipt.new(goods).send(method)).to eq \
	  goods.map(&method).inject(:+)
      end
    end
  end
end
