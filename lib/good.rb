require "csv"
require "./lib/float_money_format"
require "./lib/tax_calculator"
require "./lib/tax_registry"

class Good
  using FloatMoneyFormat

  def self.parse_all str
    data = CSV.parse(str, :converters => :numeric)
    data.shift # skip header.
    data.map! { |row| Good.new *strip_whitespace(row) }
  end

  private
  def self.strip_whitespace ar
    ar.each { |el| el.strip! if el.is_a?(String) }
  end

  public
  attr_reader :quantity, :name, :price

  def initialize quantity, name, price
    @quantity, @name, @price = quantity, name, price
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
    TaxRegistry.tax_rate_for_good(name)
  end
end
