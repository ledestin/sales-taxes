module TaxRegistry
  SALES_TAX = 0.1
  IMPORT_TAX = 0.05

  def self.tax_for_good name
    tax = 0
    tax += SALES_TAX unless name =~ /(book|chocolate|pill)/
    tax += IMPORT_TAX if name =~ /imported/
    tax.round(2)
  end
end
