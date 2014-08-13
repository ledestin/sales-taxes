require 'csv'

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
    0
  end

  def total
    price
  end

  def to_s
    [quantity, name, price].map! { |el| el.to_s }.join(", ")
  end
end
