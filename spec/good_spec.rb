require './lib/good'

HEADER = "Quantity, Product, Price\n"

describe Good do
  describe '#parse_all' do
    it "returns an array of Good elements" do
      goods = Good.parse_all(HEADER + "1, 1, 1")
      expect(goods.size).to eq 1
      expect(goods.first).to be_a_kind_of(Good)
    end

    it "strips leading and trailing whitespace" do
      good = Good.parse_all(HEADER + "1, book , 1").first
      expect(good.name).to eq "book"
    end
  end

  it "#new fills atrributes from passed array" do
    good = Good.new 1, "book", 12.49
    expect(good.quantity).to eq 1
    expect(good.name).to eq "book"
    expect(good.price).to eq 12.49
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
  end
end
