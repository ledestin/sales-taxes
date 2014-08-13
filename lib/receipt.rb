class Receipt
  def initialize goods
    @goods = goods
  end

  def total
    @goods.map(&:total).inject(:+)
  end
end
