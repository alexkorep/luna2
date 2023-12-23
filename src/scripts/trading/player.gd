extends Reference
class_name Player

var funds: float
var inventory: Dictionary = {} # Stores Goods and quantities

func _init(_funds: float):
	funds = _funds

func buy(goods_name: String, quantity: int, market: Market):
	var cost = market.buy_goods(goods_name, quantity)
	if funds >= cost:
		funds -= cost
		if goods_name in inventory:
			inventory[goods_name].quantity += quantity
		else:
			var goods = market.goods_list[goods_name]
			inventory[goods_name] = Goods(goods.name, goods.base_price, quantity)

func sell(goods_name: String, quantity: int, market: Market):
	if goods_name in inventory and inventory[goods_name].quantity >= quantity:
		var revenue = market.sell_goods(goods_name, quantity)
		funds += revenue
		inventory[goods_name].quantity -= quantity
