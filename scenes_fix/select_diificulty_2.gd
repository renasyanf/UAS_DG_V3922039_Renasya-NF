extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_easy_1_pressed():
		get_tree().change_scene_to_file("res://level/level_2_easy.tscn")


func _on_medium_1_pressed():
		get_tree().change_scene_to_file("res://level/level_2_medium.tscn")
		



func _on_hard_1_pressed():
		get_tree().change_scene_to_file("res://level/level_2_hard.tscn")
