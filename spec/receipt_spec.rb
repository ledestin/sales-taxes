require './lib/good'
require './lib/receipt'

describe Receipt do
  it "#total returns sum of all goods total" do
    goods = [Good.new(1, "book", 12.49), Good.new(1, "chocolate bar", 0.85)]
    expect(Receipt.new(goods).total).to eq goods.map(&:total).inject(:+)
  end
end
