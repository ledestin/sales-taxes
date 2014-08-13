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

  def to_s
    result = <<EOF
#{@goods.join("\n")}

Sales Taxes: #{tax}
Total: #{sprintf("%.2f", total)}
EOF
  end
end
