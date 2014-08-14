module FloatMoneyFormat
  refine Float do
    def to_s style
      return super() unless style == :money
      sprintf("%.2f", self)
    end
  end
end
