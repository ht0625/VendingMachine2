class MoneyController
  attr_reader :deposit, :sales_amount

  def initialize
    @sales_amount = 0
    @deposit = 0
  end

  def add_deposit(value)
    @deposit += value
  end

  def eject
    change = @deposit
    @deposit = 0
    change
  end

  def sales(price)
    @deposit -= price
    @sales_amount += price
  end

end
