class DrinkController
  attr_reader :drinks

  def initialize
    @drinks = {}
  end

  def stock_add(name, price)
    if @drinks.has_key?(name.to_sym)
      @drinks[name.to_sym][:stock] += 1
    else
      @drinks[name.to_sym] = {price: price, stock: 5}
    end
    @drinks
  end

  def get_price(name)
    @drinks[name.to_sym][:price]
  end

  def get_stock(name)
    @drinks[name.to_sym][:stock]
  end

  def sell_drink(name)
    @drinks[name.to_sym][:stock] -= 1
  end

end
