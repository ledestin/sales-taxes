class Receipt
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

Sales Taxes: #{sprintf("%.2f", tax)}
Total: #{sprintf("%.2f", total)}
EOF
  end
end
