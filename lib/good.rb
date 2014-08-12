require 'csv'

class Good
  def self.parse_all str
    CSV.parse(str).map! { |row|
      row.each { |el| el.strip! }
      Good.new row
    }
  end

  attr_reader :quantity, :name, :price

  def initialize ar
    @quantity, @name, @price = Integer(ar[0]), ar[1], Float(ar[2])
  end
end
