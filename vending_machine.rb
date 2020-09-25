
require './drink_controller.rb'
require './money_controller.rb'
require './drink.rb'
require './money.rb'
class VendingMachine

  def initialize
    @money_controller = MoneyController.new
    @drink_controller = DrinkController.new
  end

  def insert(name)
    money = Money.new(name)
    if money.valid?
      @money_controller.add_deposit(money.value)
    else
      name
    end
  end

  def display_deposit
    @money_controller.deposit
  end

  def get_eject
    @money_controller.eject
  end

  def get_sales_amount
    @money_controller.sales_amount
  end

  def insert_drink(name, price)
    drink = Drink.new(name, price)
    @drink_controller.stock_add(drink.name.to_sym, drink.price)
  end

  def purchasable?(name)
    (@money_controller.deposit >= @drink_controller.get_price(name.to_sym)) && (@drink_controller.get_stock(name.to_sym) >= 1)
  end

  def display_drinks_stock
    @drink_controller.drinks
  end

  def sell_drink(name)
    if purchasable?(name)
      price = @drink_controller.get_price(name.to_sym)
      @money_controller.sales(price)
      @drink_controller.sell_drink(name.to_sym)
    end
    display_deposit
  end

  def purchasable_drink_names
    @drink_controller.drinks.select{|_, info| info[:price] <= @money_controller.deposit && info[:stock] >= 1 }.keys
  end

end

# require '/Users/tamura/workspace/VM/VM2/vending_machine.rb'
# vm = VendingMachine.new

#step0~1
#お金投入
# vm.insert("100円玉")
# vm.insert("500円玉")
# vm.insert("1円玉")

#投入金額確認
# vm.display_deposit

#返金
# vm.get_eject

#step2,4
#ドリンク投入
# vm.insert_drink("cola",120)
# vm.insert_drink("redbull",220)

#ドリンク在庫確認
# vm.display_drinks_stock

#step3
#ドリンク購入
# vm.sell_drink("cola")

#売上確認
# vm.get_sales_amount

#購入可能？
# vm.purchasable?("cola")
# vm.purchasable_drink_names
