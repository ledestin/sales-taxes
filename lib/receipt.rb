class Receipt
  def initialize goods
    @goods = goods
  end

  def tax
    0
  end

  def total
    @goods.map(&:total).inject(:+)
  end
end
