extends Control


onready var WelcomeLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/WelcomeRow/WelcomeLabel
onready var LevelLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/LevelRow/LevelLabel
onready var FundsLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/FuncsRow/FundsLabel
onready var DescriptionLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/PanetDescriptionRow/DescriptionLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	var planet_id = GameState.planet_id
	var planet = PlanetsData.get_planet_by_id(planet_id)
	WelcomeLabel.text = "Welcome to " + planet["Name"]
	LevelLabel.text = str(planet["TechLevel"])
	FundsLabel.text = str(GameState.funds) + ' cr'
	DescriptionLabel.text = planet["Description"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MapButton_pressed():
	get_tree().change_scene("res://scenes/planet_list_screen/planet_list_screen.tscn")

func _on_TradeButton_pressed():
	get_tree().change_scene("res://scenes/trade_screen/trade_screen.tscn")


func _on_SpaceButton_pressed():
	get_tree().change_scene("res://scenes/space/space.tscn")
