extends Reference
class_name Goods

var name: String
var base_price: float
var quantity: int

func _init(_name: String, _base_price: float, _quantity: int):
	name = _name
	base_price = _base_price
	quantity = _quantity
