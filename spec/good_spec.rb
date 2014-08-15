require "spec_helper"
require "./lib/good"

HEADER = "Quantity, Product, Price\n"

describe Good do
  describe "#parse_all" do
    it "returns an array of Good elements" do
      goods = Good.parse_all(HEADER + "1, 1, 1")
      expect(goods.size).to eq 1
      expect(goods.first).to be_a_kind_of(Good)
    end

    it "strips leading and trailing whitespace" do
      good = Good.parse_all(HEADER + "1, book , 1").first
      expect(good.name).to eq "book"
    end

    it "converts strings to numbers" do
      good = Good.parse_all(HEADER + "1, book , 10.50").first
      expect(good.quantity).to eq 1
      expect(good.price).to eq 10.50
    end
  end

  describe "#tax returns amount of tax for the good:" do
    it "zero for books" do
      good = Good.new 1, "book", 10.0
      expect(good.tax).to be_zero
    end

    it "5% for imported books" do
      good = Good.new 1, "imported book", 10.0
      expect(good.tax).to eq 0.5
    end

    it "10% for music CDs" do
      good = Good.new 1, "music CD", 14.99
      expect(good.tax).to eq 1.5
    end

    it "double for 2 books" do
      good = Good.new 2, "music CD", 10
      expect(good.tax).to eq 2
    end

    it "rounded up to the nearest 0.05" do
      good = Good.new 1, "imported bottle of perfume", 47.50
      expect(good.tax).to eq 7.15
    end
  end

  describe "#total returns sum of price + tax, multiplied by quantity" do
    it "one book" do
      good = Good.new 1, "music CD", 10.0
      expect(good.total).to eq 11
    end

    it "two books" do
      good = Good.new 2, "music CD", 10.0
      expect(good.total).to eq 22
    end
  end

  it "#to_s returns quantity, name and total" do
    good = Good.new 2, "book", 10.0
    expect(good.to_s).to eq "2, book, 20.00"
  end
end
