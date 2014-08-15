require "csv"
require "./lib/float_money_format"
require "./lib/tax_calculator"
require "./lib/tax_registry"

class GoodPack
  using FloatMoneyFormat

  def self.parse_all str
    strip_whitespace_converter = lambda { |el| el.strip! if el.is_a?(String) }
    data = CSV.parse(str, :converters => [:numeric, strip_whitespace_converter])
    data.shift # skip header.
    data.map! { |row| GoodPack.new *row }
  end

  attr_reader :quantity, :name, :price

  def initialize quantity, name, price, tax_registry: TaxRegistry
    @quantity, @name, @price = quantity, name, price
    @tax_registry = tax_registry
  end

  def tax
    tax_for_single_good * quantity
  end

  def total
    (price * quantity) + tax
  end

  def to_s
    [quantity.to_s, name, total.to_s(:money)].join(", ")
  end

  private
  def tax_for_single_good
    TaxCalculator.calc_tax(price, tax_rate)
  end

  def tax_rate
    @tax_registry.tax_rate_for_good(name)
  end
end
