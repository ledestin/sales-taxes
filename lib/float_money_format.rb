module FloatMoneyFormat
  refine Float do
    def to_s style = :none
      return super() unless style == :money

      sprintf("%.2f", self)
    end
  end

  refine Numeric do
    def to_formatted_s format = :default
      return super() unless format == :money

      sprintf("%.2f", self)
    end
  end
end
