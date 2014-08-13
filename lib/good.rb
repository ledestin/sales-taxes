require 'csv'
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
    round_tax(price * TaxRegistry.tax_for_good(name))
  end

  def total
    ((price + tax) * quantity).round(2)
  end

  def to_s
    [quantity, name, sprintf("%.2f", total)].map! { |el| el.to_s }.join(", ")
  end

  private
  def round_tax number
    ((number * (1 / 0.05)).ceil / (1 / 0.05)).round(2)
  end
end
