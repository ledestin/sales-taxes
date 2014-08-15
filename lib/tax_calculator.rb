module TaxCalculator
  def self.calc_tax(amount, tax_rate)
    tax = amount * tax_rate
    round_up_to_nearest_5_cents(tax)
  end

  def self.round_up_to_nearest_5_cents amount
    (amount * (1 / 0.05)).ceil / (1 / 0.05)
  end
end
