require "spec_helper"
require "./lib/good_pack"

module FakeTaxRates
  def self.tax_rate_for_good name
    0.1
  end
end

Item = ShoppingCart::Item

describe Item do
  describe "#tax returns amount of tax for the good:" do
    it "10% for item" do
      good = Item.new 1, "item", 10.0, tax_rates: FakeTaxRates
      expect(good.tax).to eq 1
    end

    it "double for 2 items" do
      good = Item.new 2, "item", 10, tax_rates: FakeTaxRates
      expect(good.tax).to eq 2
    end

    it "rounded up to the nearest 0.05" do
      good = Item.new 1, "item", 47.30, tax_rates: FakeTaxRates
      expect(good.tax).to eq 4.75
    end
  end

  describe "#total returns unit_price + tax, multiplied by quantity" do
    it "one item" do
      good = Item.new 1, "item", 10.0, tax_rates: FakeTaxRates
      expect(good.total).to eq 11
    end

    it "two items" do
      good = Item.new 2, "item", 10.0, tax_rates: FakeTaxRates
      expect(good.total).to eq 22
    end
  end

  it "#to_s returns quantity, name and total" do
    good = Item.new 2, "item", 10.0, tax_rates: FakeTaxRates
    expect(good.to_s).to eq "2, item, 22.00"
  end
end
