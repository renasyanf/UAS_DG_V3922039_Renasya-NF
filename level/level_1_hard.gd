extends Node2D

@onready var skor = $myscore
@onready var highskor = $myscore2

# Called when the node enters the scene tree for the first time.
var nilai = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	load_game()
	pass # Replace with function body.

func addscore():
	nilai += 1
	skor.text = "Your Score: " + str(nilai)
	
func game_over():	
	save_game()
	get_tree().change_scene_to_file("res://scenes_fix/game_over.tscn")

func save():
	var save_dict = {
		"score" : nilai,
		"username" : "HALO",
		"position" : Vector3(0,0,0),
		"enemy" : "Dead",
		"level" : "1 hard"
	}
	return save_dict

func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)

	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return

	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()

		highskor.show()
		highskor.text = "Previous Score : " + str(node_data["score"])
