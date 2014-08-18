module TaxRates
  SALES_TAX = 0.1
  IMPORT_TAX = 0.05

  def self.rate_for_product(name)
    tax = 0
    tax += SALES_TAX unless name =~ /(book|chocolate|pill)/
    tax += IMPORT_TAX if name =~ /imported/
    tax
  end
end
