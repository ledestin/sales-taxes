require './lib/good'

describe Good do
  describe '#parse_all' do
    it "returns an array of Good elements" do
      goods = Good.parse_all("1, 1, 1")
      expect(goods.size).to eq 1
      expect(goods.first).to be_a_kind_of(Good)
    end

    it "strips leading and trailing whitespace" do
      good = Good.parse_all("1, book , 1").first
      expect(good.name).to eq "book"
    end
  end

  it "#new fills atrributes from passed array" do
    good = Good.new [1, "book", 12.49]
    expect(good.quantity).to eq 1
    expect(good.name).to eq "book"
    expect(good.price).to eq 12.49
  end
end
