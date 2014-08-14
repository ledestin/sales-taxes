require 'csv'
require './lib/tax_calculator'
require './lib/tax_registry'

class Good
  def self.parse_all str
    data = CSV.parse(str, :converters => :numeric)
    data.shift
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
    tax_rate = TaxRegistry.tax_for_good(name)
    TaxCalculator.calc_tax(price, tax_rate)
  end

  def total
    ((price + tax) * quantity).round(2)
  end

  def to_s
    [quantity, name, sprintf("%.2f", total)].map! { |el| el.to_s }.join(", ")
  end
end
