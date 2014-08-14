module TaxCalculator
  def self.calc_tax(amount, tax_rate)
    tax = amount * tax_rate
    (tax * (1 / 0.05)).ceil / (1 / 0.05)
  end
end
