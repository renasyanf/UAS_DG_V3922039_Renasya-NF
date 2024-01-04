extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes_fix/select_diificulty_1.tscn")
	
	


func _on_level_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes_fix/select_diificulty_2.tscn")
