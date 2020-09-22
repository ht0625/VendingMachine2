class DrinkController
  def initialize
    @stock = 5
    @drinks = {}
  end

  def display_drinks
    @drinks
  end

  def stock_add(name, price)
    if @drinks.has_key?(:"#{name}")
      @drinks[:"#{name}"][:stock] += 1
    else
      @drinks[:"#{name}"] = {price: price, stock: @stock}
    end
    @drinks
  end

  def get_price(name)
    @drinks[:"#{name}"][:price]
  end

  def get_stock(name)
    @drinks[:"#{name}"][:stock]
  end

  def sell_drink(name)
    @drinks[:"#{name}"][:stock] -= 1
  end

end
