extends Node2D

class_name LevelB2

@onready var heartcontainer = $CanvasLayer/GUI/MarginContainer/HBoxContainer/HeartContainer
@onready var konten: ContentB2 = $CanvasLayer/ContentHuruf2
@onready var labelscore = $CanvasLayer/GUI/Panel3/Scorelabel
@onready var labellevel = $CanvasLayer/GUI/MarginContainer/HBoxContainer/RichTextLabel
@onready var sfx1 = $AudioStreamPlayer2D

var current_question = 0
var current_level = 0
var current_question_index = 0
var current_question_set: Array = []

var question_sets: Array = ListPertanyaan.pertanyaan_huruf2.duplicate()

#var scene_id = "bermain_huruf"

func _ready():
#	sfx1.play()
	Audio.play_music(preload("res://Assets/sound/cute-funny-kids-music-247318.mp3"))
	Audio.set_music_volume(0.25)
	sfx1.play()
	Global.load_game_huruf2()
	Global.set_game_type(Score.Tipe.HURUF2)
	current_question = Global.current_level
	
	question_sets.shuffle()
	update_level_label()
	
	heartcontainer.setMaxHearts(Global.maxheart)
	heartcontainer.updateHeart(Global.current_heart)
	
	randomize()
	
	
	update_score_display()
	
	
#	memunculkan pertanyaan
	set_konten(ListPertanyaan.pertanyaan_huruf2[current_question])
	
		
#berpindah ke pertanyaan selanjutnya
func next_question():
	current_question += 1
	if current_question < 5:
		set_konten(question_sets.pop_front())
		update_level_label()
		Global.current_level = current_question
		Global.save_game_huruf2()
	else:
		await get_tree().create_timer(1.0).timeout
		game_over()


func set_konten(isi_konten):
	konten.reset_jawaban()
	
	konten.text1(isi_konten.text1)
	konten.text2(isi_konten.text2)
	konten.text3(isi_konten.text3)
	
#	konten.ganti_pertanyaan(isi_konten.text)
	konten.opsi1(isi_konten.opsi1)
	konten.opsi2(isi_konten.opsi2)
	konten.opsi3(isi_konten.opsi3)
	
	konten.set_jawaban(isi_konten.jawaban_benar)
#	konten.set_objects(isi_konten.texture) #, isi_konten.object_type
#	print("objects:", isi_konten.num_object)

func update_level_label():
	labellevel.text = "[center]" + "Level " + str(current_question + 1) + "[/center]"
	
#skor
func update_score_display():
	labelscore.text = str(Global.score)

func increase_score():
	Global.score += 1
	update_score_display()

func increase_level():
	current_question + 1
	update_level_label()
	
#nyawa
func decrease_health():
	Global.current_heart -= 1
	heartcontainer.updateHeart(Global.current_heart)
	if Global.current_heart <= 0:
		game_over()
			
func game_over():
	get_tree().change_scene_to_file("res://Result/result_huruf2.tscn")


func _on_kembali_pressed():
	get_tree().change_scene_to_file("res://Menu/menu_pilihan.tscn")
	Global.current_level = current_question
	Global.save_game_huruf2()

