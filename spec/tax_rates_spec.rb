require "spec_helper"
require "./lib/tax_rates"

def tax_rate_for_good name
  TaxRates.tax_rate_for_good name
end

describe TaxRates do
  it "self.tax_rate_for_good works" do
    expect(TaxRates.tax_rate_for_good("book")).to be_zero
  end

  describe "#tax_rate_for_good returns tax:" do
    context "zero" do
      it "for books" do
	expect(tax_rate_for_good("book")).to be_zero
      end

      it "for food" do
	expect(tax_rate_for_good("chocolate bar")).to be_zero
      end

      it "for medical products" do
	expect(tax_rate_for_good("packet of headache pills")).to be_zero
      end
    end

    context "10% on all goods, except books, food and medical products, e.g." do
      it "music CD" do
	expect(tax_rate_for_good("music CD")).to eq 0.1
      end

      it "bottle of perfume" do
	expect(tax_rate_for_good("bottle of perfume")).to eq 0.1
      end
    end

    context "5% on all imported goods, with no exemptions" do
      it "for books" do
	expect(tax_rate_for_good("imported book")).to eq 0.05
      end
    end

    context "15% on imported items that are not exempt from sales tax" do
      it "for imported music CDs" do
	expect(tax_rate_for_good("imported music CD")).to \
	  be_within(0.001).of(0.15)
      end

      it "for imported bottle of perfume" do
	expect(tax_rate_for_good("imported bottle of perfume")).to \
	  be_within(0.001).of(0.15)
      end
    end
  end
end
