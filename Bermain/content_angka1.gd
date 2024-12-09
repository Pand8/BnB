class_name Content
extends Control

#memanggil label dari list pertanyaan
@onready var label_pertanyaan :RichTextLabel = $HBoxContainer/VBoxContainer/Panel/MarginContainer/Pertanyaan
@onready var label_opsi1 :Button = $HBoxContainer/VBoxContainer/JbuttonContainer/jbutton1
@onready var label_opsi2 :Button = $HBoxContainer/VBoxContainer/JbuttonContainer/jbutton2
@onready var label_opsi3 :Button = $HBoxContainer/VBoxContainer/JbuttonContainer/jbutton3

#--------------------- SFX ---------------------#
@onready var sfxbenar : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sfxsalah : AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var vbenar : AudioStreamPlayer2D = $AudioStreamPlayer2D3
@onready var vsalah : AudioStreamPlayer2D = $AudioStreamPlayer2D4
#--------------------- SFX ---------------------#

@onready var level_timer = $LevelTimer
@onready var progressbar = $HBoxContainer/VBoxContainer2/label

var total_time = 20
var time_left = total_time

var num_object : int

#--------------------- textures ----------------------------------#
var pisang = load("res://Assets/fruit sprites/pngs/banana.png")
var blackberry = load("res://Assets/fruit sprites/pngs/black-berry-light.png")
var jeruk = load("res://Assets/fruit sprites/pngs/orange.png")
var apel = load("res://Assets/fruit sprites/pngs/red-apple.png")
var strawberry = load("res://Assets/fruit sprites/pngs/strawberry.png")
var semangka = load("res://Assets/fruit sprites/pngs/watermelon.png")
var ceri = load("res://Assets/fruit sprites/pngs/red-cherry.png")

var textures:Array = [pisang, blackberry, jeruk, apel, strawberry, semangka, ceri]
@onready var objcontainer = $HBoxContainer/VBoxContainer/Panel/MarginContainer/object_container

var jawaban_benar : int = 0
var jawaban_dipilih : int = 0

func _ready():
	progressbar.max_value = total_time
	reset_timer()

#	level_timer.start(0.1)
	label_opsi1.grab_focus()
	textures.shuffle()
	objcontainer.buah = get_texture()
	
#	objcontainer.set_max_columns(5)
	
func _process(delta):
	var remaining_time = level_timer.time_left
#	timer_label.text = "Time Left: " + str(int(remaining_time)) + "s"

#----------------------------------------------------

func banding_pertanyaan() -> bool:
	return jawaban_benar == jawaban_dipilih


#memunculkan isi dari label dan button
func ganti_pertanyaan(parameter : String):
	label_pertanyaan.text = parameter
func opsi1(parameter : String):
	list_jawaban.append(parameter)
	label_opsi1.text = parameter
func opsi2(parameter : String):
	list_jawaban.append(parameter)
	label_opsi2.text = parameter
func opsi3(parameter : String):
	list_jawaban.append(parameter)
	label_opsi3.text = parameter

func reset_jawaban():
	list_jawaban = []

func get_texture():
	return textures.pop_front()

func set_jawaban(parameter : int):
	jawaban_benar = parameter

func set_objects(num_object: int): #,object_type:String
	self.num_object = num_object
	print("Setting objects to: ", num_object)
	objcontainer.setMaxObjects(num_object)
	objcontainer.buah = get_texture()
#	objcontainer.updateObject(num_object) #, object_type

func lepas(tombol: Button):
	tombol.button_pressed = true
	await get_tree().create_timer(0.1).timeout
#	print(tombol.button_pressed)
	tombol.button_pressed = false

func _on_level_timer_timeout():
#	vsalah.play()
	time_left -= 0.1
	progressbar.value = time_left
	if time_left <= 8.0 and time_left > 7.9:
		Audio.play_sfx("timer")
		Audio.set_sfx_volume(5.0)
	if time_left <= 0:
		level_timer.stop()
		sfxsalah.play()
		await get_tree().create_timer(1.0).timeout
		get_tree().current_scene.decrease_health()
		get_tree().current_scene.next_question()

func reset_timer():
	time_left = total_time
	progressbar.value = total_time
	level_timer.start(0.1)


func _input(event):
	if event is InputEventKey and event.is_pressed():
		var tombol = event.as_text_keycode()
		for i in range(list_jawaban.size()):
			if list_jawaban[i] == tombol:
				if self.has_method("tombol" + str(i+1) + "_ditekan"):
					self.call("tombol" + str(i+1) + "_ditekan")

var list_jawaban : Array[String] = []

func button_benar():
	objcontainer.set_random_fruit()
	print("Jawaban Benar")
	time_left = total_time
	progressbar.value = total_time
	Audio.stop_sfx()
	
	sfxbenar.play()
	await get_tree().create_timer(1.0).timeout
	vbenar.play()
	
	level_timer.start(0.1)
	
	get_tree().current_scene.increase_score()
	get_tree().current_scene.next_question()
#	get_tree().current_scene.increase_level()

func button_salah():
	print("Jawaban Salah")
	sfxsalah.play()
	await get_tree().create_timer(0.5).timeout
	vsalah.play()
	get_tree().current_scene.decrease_health()

func tombol1_ditekan():
	jawaban_dipilih = 1
	lepas(label_opsi1)
	if banding_pertanyaan():
		button_benar()
	else:
		button_salah()


func tombol2_ditekan():
	jawaban_dipilih = 2
	lepas(label_opsi2)
	if banding_pertanyaan():
		button_benar()
	else:
		button_salah()
	

func tombol3_ditekan():
	jawaban_dipilih = 3
	lepas(label_opsi3)
	if banding_pertanyaan():
		button_benar()
	else:
		button_salah()
