extends Control


onready var WelcomeLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/WelcomeRow/WelcomeLabel
onready var LevelLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/LevelRow/LevelLabel
onready var FundsLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/FuncsRow/FundsLabel
onready var DescriptionLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/PanetDescriptionRow/DescriptionLabel
onready var RetireButton = $NinePatchRect/MarginContainer/MainVBoxContainer/RetireButton

# Called when the node enters the scene tree for the first time.
func _ready():
	var planet_id = GameState.planet_id
	var planet = PlanetsData.get_planet_by_id(planet_id)
	WelcomeLabel.text = "Welcome to " + planet["Name"]
	LevelLabel.text = str(planet["TechLevel"])
	FundsLabel.text = str(GameState.funds) + ' cr'
	DescriptionLabel.text = planet["Description"]
	RetireButton.visible = GameState.check_can_retire()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MapButton_pressed():
	get_tree().change_scene("res://scenes/map/map.tscn")

func _on_TradeButton_pressed():
	get_tree().change_scene("res://scenes/trade_screen/trade_screen.tscn")

func _on_RetireButton_pressed():
	get_tree().change_scene("res://scenes/ending-win/ending-win.tscn")

func _on_UpgradeButton_pressed():
	get_tree().change_scene("res://scenes/upgrade_ship/upgrade_ship.tscn")
