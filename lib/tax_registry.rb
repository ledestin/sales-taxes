module TaxRegistry
  def self.tax_for_good name
    tax = 0
    tax += 0.1 unless name =~ /(book|chocolate|pill)/
    tax += 0.05 if name =~ /imported/
    tax.round(2)
  end
end
