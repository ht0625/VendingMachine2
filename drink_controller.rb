class DrinkController
  attr_reader :drinks

  def initialize
    @drinks = {}
  end

  def stock_add(name, price)
    if @drinks.has_key?(name)
      @drinks[name][:stock] += 1
    else
      @drinks[name] = {price: price, stock: 5}
    end
    @drinks
  end

  def get_price(name)
    @drinks[name][:price]
  end

  def get_stock(name)
    @drinks[name][:stock]
  end

  def sell_drink(name)
    @drinks[name][:stock] -= 1
  end

end
