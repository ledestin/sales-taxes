module TaxRegistry
  def self.tax_for_good name
    return 0 if name =~ /(book|chocolate|pill)/
    0.1
  end
end
