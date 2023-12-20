extends Control

var step = 0
var groups = [
	"step01", 
	"step02",
	"step03",
	"step04",
	"step05",
]

# Called when the node enters the scene tree for the first time.
func _ready():
	# Hide all the controls
	for group in groups:
		set_group_visibility(group, false)
	set_group_visibility(groups[0], true)

func set_group_visibility(group_name, visible):
	var controls = get_tree().get_nodes_in_group(group_name)
	for control in controls:
		control.visible = visible

func _on_Timer_timeout():
	# Hide the controls in the current group
	var group = groups[step]
	set_group_visibility(group, false)
	# Increment the step
	step += 1
	if step >= groups.size():
		step = 0
	# Show the controls in the next group
	group = groups[step]
	set_group_visibility(group, true)

