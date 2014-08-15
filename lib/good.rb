require "csv"
require "./lib/float_money_format"
require "./lib/tax_calculator"
require "./lib/tax_registry"

class Good
  using FloatMoneyFormat

  def self.parse_all str
    data = CSV.parse(str, :converters => :numeric)
    data.shift # skip header.
    data.map! { |row|
      row.each { |el| el.strip! if el.is_a?(String) }
      Good.new *row
    }
  end

  attr_reader :quantity, :name, :price

  def initialize quantity, name, price
    @quantity, @name, @price = quantity, name, price
  end

  def tax
    TaxCalculator.calc_tax(price, tax_rate) * quantity
  end

  def total
    (price * quantity + tax).round(2)
  end

  def to_s
    [quantity.to_s, name, total.to_s(:money)].join(", ")
  end

  private
  def tax_rate
    TaxRegistry.tax_rate_for_good(name)
  end
end
