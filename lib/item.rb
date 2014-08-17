require "./lib/numeric_money_format"
require "./lib/tax_calculator"
require "./lib/tax_rates"

class ShoppingCart
  class Item
    using NumericMoneyFormat

    attr_reader :quantity, :name, :unit_price

    def initialize(quantity, name, unit_price, tax_rates: TaxRates)
      @quantity, @name, @unit_price = quantity, name, unit_price
      @tax_rates = tax_rates
    end

    def tax
      unit_tax * quantity
    end

    def total
      unit_total * quantity
    end

    def to_s
      [quantity.to_s, name, total.to_formatted_s(:money)].join(", ")
    end

    private
    def tax_rate
      @tax_rates.tax_rate_for_good(name)
    end

    def unit_tax
      TaxCalculator.calc_tax(unit_price, tax_rate)
    end

    def unit_total
      unit_price + unit_tax
    end
  end
end
