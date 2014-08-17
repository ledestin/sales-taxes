require "./lib/numeric_money_format"

class ShoppingCart
  class Receipt
    using NumericMoneyFormat

    def initialize(items)
      @items = items
    end

    def tax
      @items.map(&:tax).inject(:+)
    end

    def total
      @items.map(&:total).inject(:+)
    end

    def to_s
      <<EOF
#{@items.join("\n")}

Sales Taxes: #{tax.to_formatted_s :money}
Total: #{total.to_formatted_s :money}
EOF
    end
  end
end
