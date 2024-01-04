extends Node2D

@onready var highscore = $Control/myscore

# Called when the node enters the scene tree for the first time.
func _ready():
	if not FileAccess.file_exists("user://savegame.save"):
		return

	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		print (node_data)
		highscore.text = "Your Score : " + str(node_data["score"])
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#toggle()
	#resume.show()
	#save.show
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes_fix/main_menu.tscn")


func _on_exit_pressed():
	get_tree().quit()
