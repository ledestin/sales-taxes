require "./lib/float_money"

using FloatMoneyFormat

describe FloatMoneyFormat do
  describe "to_s :money always uses 2 digits after floating point," do
    it "when there's nothing after it" do
      expect(1.0.to_s(:money)).to eq "1.00"
    end

    it "when there's >2 digits after it" do
      expect(1.1111.to_s(:money)).to eq "1.11"
    end
  end
end
