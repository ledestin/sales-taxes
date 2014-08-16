require "spec_helper"
require "./lib/good_pack"

HEADER = "Quantity, Product, Price\n"

module FakeTaxRates
  def self.tax_rate_for_good name
    0.1
  end
end

describe GoodPack do
  describe "#parse_all" do
    it "returns an array of GoodPack elements" do
      goods = GoodPack.parse_all(HEADER + "1, 1, 1")
      expect(goods.size).to eq 1
      expect(goods.first).to be_a_kind_of(GoodPack)
    end

    it "strips leading whitespace" do
      good = GoodPack.parse_all(HEADER + "1, book, 1").first
      expect(good.name).to eq "book"
    end

    it "converts strings to numbers" do
      good = GoodPack.parse_all(HEADER + "1, book, 10.50").first
      expect(good.quantity).to eq 1
      expect(good.unit_price).to eq 10.50
    end
  end

  describe "#tax returns amount of tax for the good:" do
    it "10% for item" do
      good = GoodPack.new 1, "item", 10.0, tax_rates: FakeTaxRates
      expect(good.tax).to eq 1
    end

    it "double for 2 items" do
      good = GoodPack.new 2, "item", 10, tax_rates: FakeTaxRates
      expect(good.tax).to eq 2
    end

    it "rounded up to the nearest 0.05" do
      good = GoodPack.new 1, "item", 47.30, tax_rates: FakeTaxRates
      expect(good.tax).to eq 4.75
    end
  end

  describe "#total returns unit_price + tax, multiplied by quantity" do
    it "one item" do
      good = GoodPack.new 1, "item", 10.0, tax_rates: FakeTaxRates
      expect(good.total).to eq 11
    end

    it "two items" do
      good = GoodPack.new 2, "item", 10.0, tax_rates: FakeTaxRates
      expect(good.total).to eq 22
    end
  end

  it "#to_s returns quantity, name and total" do
    good = GoodPack.new 2, "item", 10.0, tax_rates: FakeTaxRates
    expect(good.to_s).to eq "2, item, 22.00"
  end
end
