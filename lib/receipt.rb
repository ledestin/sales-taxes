require "./lib/numeric_money_format"

class ShoppingCart
  class Receipt
    using NumericMoneyFormat

    def initialize(goods)
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

Sales Taxes: #{tax.to_formatted_s :money}
Total: #{total.to_formatted_s :money}
EOF
    end
  end
end
