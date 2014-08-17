require "spec_helper"
require "./lib/shopping_cart"

HEADER = "Quantity, Product, Price\n"

describe ShoppingCart do
  describe "#parse" do
    it "returns a shopping cart with ShoppingCart::Item items" do
      cart = ShoppingCart.parse(HEADER + "1, 1, 1")
      expect(cart.items.size).to eq 1
      expect(cart.items.first).to be_a_kind_of(ShoppingCart::Item)
    end

    it "strips leading whitespace" do
      good = ShoppingCart.parse(HEADER + "1, book, 1").items.first
      expect(good.name).to eq "book"
    end

    it "converts strings to numbers" do
      good = ShoppingCart.parse(HEADER + "1, book, 10.50").items.first
      expect(good.quantity).to eq 1
      expect(good.unit_price).to eq 10.50
    end
  end
end
