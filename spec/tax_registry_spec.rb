require './lib/tax_registry'

describe TaxRegistry do
  describe "#tax_for_good returns tax:" do
    context "zero" do
      it "for books" do
	expect(TaxRegistry.tax_for_good("book")).to be_zero
      end

      it "for food" do
	expect(TaxRegistry.tax_for_good("chocolate bar")).to be_zero
      end

      it "for medical products" do
	expect(TaxRegistry.tax_for_good("packet of headache pills")).to be_zero
      end
    end

    context "10% on all goods, except books, food and medical products, e.g." do
      it "music CD" do
	expect(TaxRegistry.tax_for_good("music CD")).to eq 0.1
      end

      it "bottle of perfume" do
	expect(TaxRegistry.tax_for_good("bottle of perfume")).to eq 0.1
      end
    end
  end
end
