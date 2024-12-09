extends CanvasLayer

@onready var comment_label = $Control/ColorRect/RichTextLabel
#@onready var score_label = 
@onready var name_label = $Control/HBoxContainer/VBoxContainer/TextureRect4/MarginContainer/VBoxContainer/RichTextLabel4
@onready var hbox1 = $Control/HBoxContainer/VBoxContainer/TextureRect4/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer
@onready var hbox2 = $Control/HBoxContainer/VBoxContainer/TextureRect4/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2

@onready var vfx1 = $LuarBiasa
@onready var vfx2 = $hebat
@onready var vfx3 = $JanganMenyerah

func _ready():
	Audio.set_sfx_volume(1.0)
	Score.set_current_level("level2")
	name_label.text = "[center]" + str(Global.player_name) + "[/center]"
	set_score(Global.score)
	
	if Global.score == 5:
		comment_label.text = "[center]" + str("wow hebat!") + "[/center]"
		vfx1.play()
		Audio.play_sfx("hore")
		Audio.set_sound_pitch()
	if Global.score < 3:
		comment_label.text = "[center]" + str("Jangan Menyerah!") + "[/center]"
		vfx3.play()
	elif Global.score >=3 and Global.score <5:
		comment_label.text = "[center]" + str("selamat!") + "[/center]"
		vfx2.play()
		Audio.play_sfx("hore")
		Audio.set_sound_pitch()

#var max_stars = 5  # Maximum number of stars
var star_texture = preload("res://Assets/star.png")  # Path to your star texture
var star_size = Vector2(80, 80)

# Function to update the stars based on the score
func update_stars(score: int):
	# Clear the existing stars first
	clear_stars()
	
	var star1 = min(score, 3)
	var star2 = max(score - 3, 0)
	
	hbox1.alignment = BoxContainer.ALIGNMENT_CENTER
	hbox2.alignment = BoxContainer.ALIGNMENT_CENTER
	
	const max_col := 3
	var rows := ceili(score as float/max_col as float)
	
#	for i in range(rows):
#		var dup_hbox = HBoxContainer.new()
#		dup_hbox.alignment = BoxContainer.ALIGNMENT_CENTER
#		dup_hbox.set_size(Vector2(900, 400))
#		var num := max_col if i != score - 1 else score % max_col
#		for j in range(num):
#			var star = create_star()
#			dup_hbox.add_child(star)
#		self.add_child(dup_hbox)
		
	for i in range(star1):
		var star = create_star()
		hbox1.add_child(star)

	# Add remaining stars to the second row
	for i in range(star2):
		var star = create_star()
		hbox2.add_child(star)
	
func create_star():
#	# Loop to create stars according to the score
#	for i in range(score):
	var star = TextureRect.new()
	star.texture = star_texture
#		star.size = Vector2(50, 50)
	star.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	star.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	star.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	star.size_flags_vertical = Control.SIZE_EXPAND_FILL
	star.set_size(star_size)
	return star

func clear_stars():
	for child in hbox1.get_children():
		hbox1.remove_child(child)
		child.queue_free()
	for child in hbox1.get_children():
		hbox2.remove_child(child)
		child.queue_free()


func set_score(score: int):
	update_stars(score)
	
#func _exit_tree():
#	Global.reset_game()

func _on_button_pressed():
	Global.reset_game()
	Global.save_game_angka2()
	get_tree().change_scene_to_file("res://Menu/menu_pilihan.tscn")

func _on_button_2_pressed():
	Global.reset_game()
	Global.save_game_angka2()
	get_tree().change_scene_to_file("res://Bermain2/Level_Angka2.tscn")
