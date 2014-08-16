require "csv"
require "./lib/numeric_money_format"
require "./lib/tax_calculator"
require "./lib/tax_rates"

class GoodPack
  using NumericMoneyFormat

  def self.parse_all string
    strip_whitespace_converter = lambda { |el| el.strip! if el.is_a?(String) }
    data = CSV.parse(string,
      :converters => [:numeric, strip_whitespace_converter])
    data.shift # skip header.
    data.map! { |row| GoodPack.new *row }
  end

  attr_reader :quantity, :name, :price

  def initialize quantity, name, price, tax_rates: TaxRates
    @quantity, @name, @price = quantity, name, price
    @tax_rates = tax_rates
  end

  def tax
    tax_for_single_good * quantity
  end

  def total
    (price * quantity) + tax
  end

  def to_s
    [quantity.to_s, name, total.to_formatted_s(:money)].join(", ")
  end

  private
  def tax_for_single_good
    TaxCalculator.calc_tax(price, tax_rate)
  end

  def tax_rate
    @tax_rates.tax_rate_for_good(name)
  end
end
