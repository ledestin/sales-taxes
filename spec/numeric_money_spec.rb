require "./lib/numeric_money_format"

using NumericMoneyFormat

describe NumericMoneyFormat do
  describe "to_formatted_s" do
    context ":money always uses 2 digits after floating point," do
      it "when there's nothing after it" do
	expect(1.0.to_formatted_s(:money)).to eq "1.00"
      end

      it "when there's >2 digits after it" do
	expect(1.1111.to_formatted_s(:money)).to eq "1.11"
      end

      it "also works for integers" do
	expect(10.to_formatted_s(:money)).to eq "10.00"
      end
    end
  end
end
