require './lib/good'

describe Good do
  it "#parse_all returns an array of Good elements" do
    goods = Good.parse_all("1, 1, 1")
    expect(goods.size).to eq 1
    expect(goods.first).to be_a_kind_of(Good)
  end

  it '#new fills atrributes from passed array' do
    good = Good.new ["1", "book", "12.49"]
    expect(good.quantity).to eq 1
    expect(good.name).to eq "book"
    expect(good.price).to eq 12.49
  end
end
