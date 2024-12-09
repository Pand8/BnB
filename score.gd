extends Node

var high_scores: Array[Dictionary] = []
# { score : int, type: angka/huruf }

enum Tipe {
	HURUF1,
	HURUF2,
	ANGKA1,
	ANGKA2
}

const MAX_SCORES = 5

const SAVEFILE = "user://scores.json"

const SAVE_PATH = "user://high_scores_{0}.dat"

var level_type = "level1"

func load_data():
	if !FileAccess.file_exists(SAVEFILE):
		print("Tidak ada save file")
		return
	var f:= FileAccess.open(SAVEFILE, FileAccess.READ)
	print("Save file ditemukan")
	if f:
		var data = JSON.parse_string(f.get_as_text())
		for i in data:
			high_scores.append(i)
			
func masukkan_data(skor: int, tipe: Tipe):
	high_scores.append({"skor": skor, 'type': tipe})
	print("Data tersimpan")
	
func simpan_json():
	var string_data = JSON.stringify(high_scores)
	var f := FileAccess.open(SAVEFILE, FileAccess.WRITE)
	f.store_string(string_data)
	print("Menulis data ke file JSON")
	
func _ready():
	load_data()
	pass

func set_current_level(level: String):
	level_type = level
	load_scores()
	print(level_type)
	
func save_scores():
	pass
#	var file_path = SAVE_PATH.format([level_type])
#	var file = FileAccess.open(file_path, FileAccess.WRITE)
#	if file:
#		file.store_var(high_scores)
#		file.close()
#	else:
#		high_scores = []
		
func load_scores():
	pass
#	var file_path = SAVE_PATH.format(level_type)
#	var file = FileAccess.open(file_path, FileAccess.READ)
#	if file:
#		var saved_data = file.get_var()
#		if saved_data is Array:
#			high_scores = saved_data
#		else:
#			high_scores = []
#		file.close()
#	else:
#		high_scores = []
	
#	print("Loaded Scores: ", high_scores)

# Add a new score (name and score) to the high score list
func add_score(name, score: int, type: Tipe):
	high_scores.append({"name": name, "score": score, "type": type})
	
	# Sort the list by score (highest first)

	
	for i in range(high_scores.size()):
		print("Score ", i + 1, ": ", high_scores[i]["name"], high_scores[i]["score"])
		
	# Save the updated list
	simpan_json()

# Comparator function to sort scores
func _compare_scores(a: Dictionary, b: Dictionary) -> bool:
	if a['score'] > b['score']:
		return true
	else:
		return false
#	return b["score"] - a["score"]
#	print(b["score"] - a["score"])

# Get the high score list for display purposes
func get_high_scores(t:Tipe) -> Array:
#	print("skornya segini lek:", high_scores)
	
	
	var topsingko = high_scores.duplicate().filter(func(a): return a["type"] == t)
	
	topsingko.sort_custom(func(a: Dictionary, b:Dictionary): return a['score'] > b['score'])
	
	# Keep only the top 5 scores
	if topsingko.size() > MAX_SCORES:
		topsingko.resize(MAX_SCORES)
		
	return topsingko

func reset_scores():
	high_scores.clear()
	simpan_json()
	print("Scores have been reset.")
