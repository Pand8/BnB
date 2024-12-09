extends Node2D

class_name Level

@onready var heartcontainer = $CanvasLayer/GUI/MarginContainer/HBoxContainer/HeartContainer
@onready var konten : Content = $CanvasLayer/Content
@onready var labelscore = $CanvasLayer/GUI/Panel2/Scorelabel
@onready var popupmessage = $CanvasLayer/Popup
@onready var labellevel = $CanvasLayer/GUI/MarginContainer/HBoxContainer/RichTextLabel
@onready var sfx1 = $AudioStreamPlayer2D2


var current_question = 0
var current_level = 0
var current_question_index = 0
var current_question_set: Array = []

var question_sets: Array = ListPertanyaan.pertanyaan_angka.duplicate()
#var scene_id = "bermain_angka"

func _ready():
	Audio.play_music(preload("res://Assets/sound/cute-funny-kids-music-247318.mp3"))
	Audio.set_music_volume(0.2)
	Global.load_game_angka()
	Global.set_game_type(Score.Tipe.ANGKA1)
	current_question = Global.current_level
	
	question_sets.shuffle()
	sfx1.play()
	update_level_label()
	
	heartcontainer.setMaxHearts(Global.maxheart)
	heartcontainer.updateHeart(Global.current_heart)
	
	
	update_score_display()
	
#	memunculkan konten
	set_konten(question_sets.pop_front())
	
#	set_level(current_level)

#berpindah ke pertanyaan selanjutnya
func next_question():
	current_question += 1
	if current_question < 5:
		set_konten(question_sets.pop_front())
		update_level_label()
		Global.current_level = current_question
		Global.save_game_angka()
	else:
		await get_tree().create_timer(1.0).timeout
		game_over()

var list_jawaban : Array[String] = []
var jawaban : int = 0

func set_konten(isi_konten):
	konten.reset_jawaban()
	konten.ganti_pertanyaan(isi_konten.text)
	konten.opsi1(isi_konten.opsi1)
	konten.opsi2(isi_konten.opsi2)
	konten.opsi3(isi_konten.opsi3)
	konten.set_jawaban(isi_konten.jawaban_benar)
#	konten.set_num(isi_konten.num_object)
	konten.set_objects(isi_konten.num_object)
	print("objects:", isi_konten.num_object)
	konten.reset_timer()

#Level label
func update_level_label():
	labellevel.text = "[center]Level " + str(current_question + 1 ) + "[/center]"


#skor
func update_score_display():
	labelscore.text = str(Global.score)

func increase_score():
	Global.score += 1
	update_score_display()


#nyawa
func decrease_health():
	Global.current_heart -= 1
	heartcontainer.updateHeart(Global.current_heart)
	if Global.current_heart <= 0:
		game_over()



func game_over():
	get_tree().change_scene_to_file("res://Result/result_angka.tscn")


func _on_kembali_pressed():
	get_tree().change_scene_to_file("res://Menu/menu_pilihan.tscn")
	Global.current_level = current_question
	Global.save_game_angka()
