require 'csv'

class Good
  def self.parse_all str
    CSV.parse(str).map! { |row|
      Good.new row
    }
  end

  def initialize ar
  end
end
