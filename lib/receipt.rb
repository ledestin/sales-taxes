require './lib/float_money_format'

class Receipt
  using FloatMoneyFormat

  def initialize goods
    @goods = goods
  end

  def tax
    @goods.map(&:tax).inject(:+)
  end

  def total
    @goods.map(&:total).inject(:+)
  end

  def to_s
    <<EOF
#{@goods.join("\n")}

Sales Taxes: #{tax.to_s(:money)}
Total: #{total.to_s(:money)}
EOF
  end
end
