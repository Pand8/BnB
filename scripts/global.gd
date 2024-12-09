extends Node

var score = 0
var maxheart = 5
var current_level = 0
var current_heart: int =  maxheart
var player_name:= ""
var type: Score.Tipe = -1
#var scene_id = "global"
#const savepath := "user://save.json"

var save_data = {
	"huruf": {},
	"angka": {}
}

# save_data["huruf"]

#@onready var bgm1 = load("res://Assets/sound/cute-funny-kids-music-247318.mp3")

func _ready():
	load_game()

func set_game_type(game_type):
	type = game_type
	print("Tipe game:", type)

func save_game_angka():
	var save_path = "user://save_angka.dat"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_level)
	file.store_var(score)
	file.close()
	
func save_game_angka2():
	var save_path = "user://save_angka2.dat"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_level)
	file.store_var(score)
	file.close()

func save_game_huruf():
	var save_path = "user://save_huruf.dat"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_level)
	file.store_var(score)
	file.close()
#	save_data["huruf"]["score"] = score
#	save_data["huruf"]["maxheart"] = maxheart
#	save_data["huruf"]["current_heart"] = current_heart
#	save_data["huruf"]["current_level"] = current_level

func save_game_huruf2():
	var save_path = "user://save_huruf2.dat"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_level)
	file.store_var(score)
	file.close()
	
		
func load_game_angka():
#	var save_path = "user://save_" + scene_id + ".save"
	var save_path = "user://save_angka.dat"
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		current_level = file.get_var()
		score = file.get_var()
		file.close()
	else:
		reset_game()
		save_game()
		
func load_game_angka2():
#	var save_path = "user://save_" + scene_id + ".save"
	var save_path = "user://save_angka2.dat"
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		current_level = file.get_var()
		score = file.get_var()
		file.close()
	else:
		reset_game()
		save_game()
		
func load_game_huruf():
#	var save_path = "user://save_" + scene_id + ".save"
	var save_path = "user://save_huruf.dat"
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		current_level = file.get_var()
		score = file.get_var()
		file.close()
	else:
		reset_game()
#		save_game()

func load_game_huruf2():
#	var save_path = "user://save_" + scene_id + ".save"
	var save_path = "user://save_huruf2.dat"
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		current_level = file.get_var()
		score = file.get_var()
		file.close()
	else:
		reset_game()


func save_game():
#	var save_data = {
#		"score": score,
#		"maxheart": maxheart,
#		"current_heart": current_heart,
#		"current_level": current_level
#	}
#	var save_path = "user://save_" + scene_id + ".save"
	var save_path = "user://save.dat"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_level)
	file.store_var(score)
	file.close()
	
func load_game():
#	var save_path = "user://save_" + scene_id + ".save"
	var save_path = "user://save.dat"
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		current_level = file.get_var()
		score = file.get_var()
		file.close()
	else:
		reset_game()
		save_game()
	
func reset_game():
	score = 0
	current_heart = 5
	current_level = 0
#	save_game()
	
func _exit_tree():
	reset_game()
#	save_game()
	
func reset_score():
	score = 0

func reset_heart():
	current_heart = 5
