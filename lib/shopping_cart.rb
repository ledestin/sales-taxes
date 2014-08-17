require "csv"
require "./lib/item"
require "./lib/receipt"

class ShoppingCart
  def self.parse(string)
    data = CSV.parse(string, :col_sep => ", ", :converters => :numeric)
    data.shift # skip header.
    ShoppingCart.new(data.map! { |row| Item.new *row })
  end

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def receipt
    Receipt.new(items)
  end
end
