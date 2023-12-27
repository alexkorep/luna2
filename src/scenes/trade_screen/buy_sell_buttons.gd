extends Control

export var max_buy_qty = 0
export var max_sell_qty = 0

signal buy(qty)
signal sell(qty)

func _process(delta):
	$VBoxContainer/HBoxContainer/Buy1Button.disabled = max_buy_qty < 1
	$VBoxContainer/HBoxContainer/Sell1Button.disabled = max_sell_qty < 1
	$VBoxContainer/HBoxContainer2/BuyMaxButton.disabled = max_buy_qty < 1
	$VBoxContainer/HBoxContainer2/SellMaxButton.disabled = max_sell_qty < 1

func _on_Buy1Button_pressed():
	emit_signal("buy", 1)

func _on_Sell1Button_pressed():
	emit_signal("sell", 1)

func _on_BuyMaxButton_pressed():
	emit_signal("buy", max_buy_qty)

func _on_SellMaxButton_pressed():
	emit_signal("sell", max_sell_qty)
