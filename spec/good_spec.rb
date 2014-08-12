require './lib/good'

describe Good do
  it "#parse_all returns an array of Good elements" do
    goods = Good.parse_all("1, 1, 1")
    expect(goods.size).to eq 1
    expect(goods.first).to be_a_kind_of(Good)
  end
end
