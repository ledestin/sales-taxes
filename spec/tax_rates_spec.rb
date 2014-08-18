require "spec_helper"
require "./lib/tax_rates"

def rate_for_product name
  TaxRates.rate_for_product name
end

describe TaxRates do
  describe "#rate_for_product returns tax:" do
    context "zero" do
      it "for books" do
	expect(rate_for_product("book")).to be_zero
      end

      it "for food" do
	expect(rate_for_product("chocolate bar")).to be_zero
      end

      it "for medical products" do
	expect(rate_for_product("packet of headache pills")).to be_zero
      end
    end

    context "10% on all goods, except books, food and medical products, e.g." do
      it "music CD" do
	expect(rate_for_product("music CD")).to eq 0.1
      end

      it "bottle of perfume" do
	expect(rate_for_product("bottle of perfume")).to eq 0.1
      end
    end

    context "5% on all imported goods, with no exemptions" do
      it "for books" do
	expect(rate_for_product("imported book")).to eq 0.05
      end
    end

    context "15% on imported items that are not exempt from sales tax" do
      it "for imported music CDs" do
	expect(rate_for_product("imported music CD")).to \
	  be_within(0.001).of(0.15)
      end

      it "for imported bottle of perfume" do
	expect(rate_for_product("imported bottle of perfume")).to \
	  be_within(0.001).of(0.15)
      end
    end
  end
end
