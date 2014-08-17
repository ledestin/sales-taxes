module NumericMoneyFormat
  refine Numeric do
    def to_formatted_s(format = :default)
      return super() unless format == :money

      sprintf("%.2f", self)
    end
  end
end
