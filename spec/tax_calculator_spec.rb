require "spec_helper"
require "./lib/tax_calculator"

describe TaxCalculator do
  describe "#calc_tax calculates tax" do
    it "(no rounding up needed)" do
      expect(TaxCalculator.calc_tax(10, 0.15)).to eq 1.50
    end

    it "(rounds up to nearest 0.05)" do
      expect(TaxCalculator.calc_tax(47.50, 0.15)).to eq 7.15
      expect(TaxCalculator.calc_tax(11.25, 0.05)).to eq 0.60
    end
  end
end
