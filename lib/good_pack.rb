require "csv"
require "./lib/numeric_money_format"
require "./lib/tax_calculator"
require "./lib/tax_rates"

class GoodPack
  using NumericMoneyFormat

  def self.parse_all string
    data = CSV.parse(string, :col_sep => ", ", :converters => :numeric)
    data.shift # skip header.
    data.map! { |row| GoodPack.new *row }
  end

  attr_reader :quantity, :name, :unit_price

  def initialize quantity, name, unit_price, tax_rates: TaxRates
    @quantity, @name, @unit_price = quantity, name, unit_price
    @tax_rates = tax_rates
  end

  def tax
    tax_for_single_good * quantity
  end

  def total
    (unit_price * quantity) + tax
  end

  def to_s
    [quantity.to_s, name, total.to_formatted_s(:money)].join(", ")
  end

  private
  def tax_for_single_good
    TaxCalculator.calc_tax(unit_price, tax_rate)
  end

  def tax_rate
    @tax_rates.tax_rate_for_good(name)
  end
end
