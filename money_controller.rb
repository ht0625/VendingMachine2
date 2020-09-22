class MoneyController
  def initialize
    @sales_amount = 0
    @change = 0
    @deposit = 0
  end
  def add_deposit(value)
    @deposit += value
  end
  def display_deposit
    @deposit
  end
  def eject
    @change = @deposit
    @deposit = 0
    @change
  end
  def sales(price)
    @deposit -= price
    @sales_amount += price
  end
  def get_sales_amount
    @sales_amount
  end
end
