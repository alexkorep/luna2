extends Reference
class_name Market
	
var goods_list: Dictionary = {} # Stores Goods objects

func add_goods(goods: Goods):
	goods_list[goods.name] = goods

func get_price(goods_name: String) -> float:
	# Price can vary based on demand, supply, or other factors
	return goods_list[goods_name].base_price

func buy_goods(goods_name: String, quantity: int) -> float:
	# Logic to handle buying goods, adjust quantity, etc.
	var total_cost = get_price(goods_name) * quantity
	goods_list[goods_name].quantity -= quantity
	return total_cost

func sell_goods(goods_name: String, quantity: int) -> float:
	# Logic to handle selling goods, adjust quantity, etc.
	var total_revenue = get_price(goods_name) * quantity
	goods_list[goods_name].quantity += quantity
	return total_revenue
