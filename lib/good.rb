require 'csv'

class Good
  def self.parse_all str
    CSV.parse(str, :converters => :numeric).map! { |row|
      row.each { |el| el.strip! if el.is_a?(String) }
      Good.new *row
    }
  end

  attr_reader :quantity, :name, :price

  def initialize quantity, name, price
    @quantity, @name, @price = quantity, name, price
  end

  def total
    price
  end
end
