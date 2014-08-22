require "spec_helper"
require "./lib/item"
require "./lib/receipt"

describe ShoppingCart::Receipt do
  let(:items) { [double(ShoppingCart::Item, :tax => 1, :total => 12.49)] }
  let(:multiple_items) {
    [double(ShoppingCart::Item, :tax => 1, :total => 12),
      double(ShoppingCart::Item, :tax => 0.10, :total => 3)]
  }

  describe "#tax sums all items' #tax" do
    it "for one item" do
      expect(ShoppingCart::Receipt.new(items).tax).to eq 1
    end

    it "for multiple items" do
      expect(ShoppingCart::Receipt.new(multiple_items).tax).to eq 1.10
    end
  end

  describe "#total sums all items' #total" do
    it "for one item" do
      expect(ShoppingCart::Receipt.new(items).total).to eq 12.49
    end

    it "for multiple items" do
      expect(ShoppingCart::Receipt.new(multiple_items).total).to eq 15
    end
  end
end
