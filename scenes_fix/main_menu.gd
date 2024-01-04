extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Replace with function body.
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Replace with function body.
	pass
	

func _on_playbutton_pressed():
	# Replace with function body.                          
	get_tree().change_scene_to_file("res://scenes_fix/level_select.tscn")

func _on_quitbutton_pressed():
	# Replace with function body.
	get_tree().quit()
