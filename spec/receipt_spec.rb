require "spec_helper"
require "./lib/item"
require "./lib/receipt"

describe ShoppingCart::Receipt do
  [:total, :tax].each do |method|
    describe "##{method} returns sum of all items' ##{method}:" do
      it "for one item" do
	items = [ShoppingCart::Item.new(1, "book", 12.49)]
	expect(ShoppingCart::Receipt.new(items).send(method)).to eq \
	  items.map(&method).inject(:+)
      end

      it "for multiple items" do
	items = [ShoppingCart::Item.new(1, "book", 12.49),
	  ShoppingCart::Item.new(1, "chocolate bar", 0.85)]
	expect(ShoppingCart::Receipt.new(items).send(method)).to eq \
	  items.map(&method).inject(:+)
      end
    end
  end
end
