require "spec_helper"
require "./lib/item"

module FakeTaxRates
  def self.tax_rate_for_good(name)
    0.1
  end
end

Item = ShoppingCart::Item

describe Item do
  describe "#tax returns amount of tax for the item:" do
    it "10% for item" do
      item = Item.new 1, "item", 10, tax_rates: FakeTaxRates
      expect(item.tax).to eq 1
    end

    it "double for 2 items" do
      item = Item.new 2, "item", 10, tax_rates: FakeTaxRates
      expect(item.tax).to eq 2
    end

    it "rounded up to the nearest 0.05" do
      item = Item.new 1, "item", 47.30, tax_rates: FakeTaxRates
      expect(item.tax).to eq 4.75
    end
  end

  describe "#total returns total cost of items, including tax:" do
    it "one item" do
      item = Item.new 1, "item", 10, tax_rates: FakeTaxRates
      expect(item.total).to eq 11
    end

    it "two items" do
      item = Item.new 2, "item", 10.0, tax_rates: FakeTaxRates
      expect(item.total).to eq 22
    end
  end

  it "#to_s returns quantity, name and total" do
    item = Item.new 2, "item", 10, tax_rates: FakeTaxRates
    expect(item.to_s).to eq "2, item, 22.00"
  end
end
