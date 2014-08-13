require './lib/good'
require './lib/receipt'

describe Receipt do
  describe "#total returns sum of all goods total" do
    it "for one good" do
      goods = [Good.new(1, "book", 12.49)]
      expect(Receipt.new(goods).total).to eq goods.map(&:total).inject(:+)
    end

    it "for multiple goods" do
      goods = [Good.new(1, "book", 12.49), Good.new(1, "chocolate bar", 0.85)]
      expect(Receipt.new(goods).total).to eq goods.map(&:total).inject(:+)
    end
  end
end
