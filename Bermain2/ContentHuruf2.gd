class_name ContentB2
extends CanvasLayer

#memanggil label dari list pertanyaan
@onready var pertanyaan = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/Pertanyaan
#@onready var label_pertanyaan :RichTextLabel = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/Pertanyaan2
@onready var label_opsi1 :Button = $Control/HBoxContainer/VBoxContainer3/JbuttonContainer2/jbutton1
@onready var label_opsi2 :Button = $Control/HBoxContainer/VBoxContainer3/JbuttonContainer2/jbutton2
@onready var label_opsi3 :Button = $Control/HBoxContainer/VBoxContainer3/JbuttonContainer2/jbutton3

@onready var kata1 : Label = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/MarginContainer/HBoxContainer/ColorRect/Pertanyaan2
@onready var kata2 : Label = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/MarginContainer/HBoxContainer/ColorRect2/Pertanyaan2
@onready var kata3 : Label = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/MarginContainer/HBoxContainer/ColorRect3/Pertanyaan2

#--------------------- SFX ---------------------#
@onready var sfxbenar : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sfxsalah : AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var vbenar : AudioStreamPlayer2D = $AudioStreamPlayer2D3
@onready var vsalah : AudioStreamPlayer2D = $AudioStreamPlayer2D4
#--------------------- SFX ---------------------#

@onready var level_timer = $LevelTimer
@onready var progressbar = $Control/HBoxContainer/VBoxContainer2/label

const WARNA = Color.RED

var total_time = 20
var time_left = total_time

var num_object : int

var jawaban_benar : int = 0
var jawaban_dipilih : int = 0


func _ready():
	progressbar.max_value = total_time
	reset_timer()
#	gambar.hewan = get_texture()

func _process(delta):
	var remaining_time = level_timer.time_left
	
#func get_texture():
#	return textures.pop_front()
var panel_style: StyleBoxTexture
var panel: StyleBoxFlat

func text1(parameter):
	kata1.text = parameter
	panel_style = StyleBoxTexture.new()
	panel_style.texture = load("res://Assets/balon kata.png")
	panel = load("res://themes/new_theme.tres::StyleBoxFlat_mae6e")
	var anu = kata1.get_parent()
	if parameter == "????":
		anu.add_theme_stylebox_override("panel", panel_style)
	else:
		anu.add_theme_stylebox_override("panel", panel)
func text2(parameter):
	kata2.text = parameter
	panel_style = StyleBoxTexture.new()
	panel_style.texture = load("res://Assets/balon kata.png")
	panel = load("res://themes/new_theme.tres::StyleBoxFlat_mae6e")
	var anu2 = kata2.get_parent()
	if parameter == "????":
		anu2.add_theme_stylebox_override("panel", panel_style)
	else:
		anu2.add_theme_stylebox_override("panel", panel)
func text3(parameter):
	kata3.text = parameter
	panel_style = StyleBoxTexture.new()
	panel_style.texture = load("res://Assets/balon kata.png")
	panel = load("res://themes/new_theme.tres::StyleBoxFlat_mae6e")
	var anu3 = kata3.get_parent()
	if parameter == "????":
		anu3.add_theme_stylebox_override("panel", panel_style)
	else:
		anu3.add_theme_stylebox_override("panel", panel)

func kotak():
	pass
#func set_objects(texture): #,object_type:String
#	print("Setting objects to: ", texture)
#	gambar.texture = texture
#	gambar.hewan = get_texture()

func banding_pertanyaan() -> bool:
	return jawaban_benar == jawaban_dipilih

#memunculkan isi dari label dan button
#func ganti_pertanyaan(parameter : String):
#	label_pertanyaan.text = "[center]" + parameter + "[/center]"
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

	
func set_jawaban(parameter : int):
	jawaban_benar = parameter
	
func lepas(tombol: Button):
	tombol.button_pressed = true
	await get_tree().create_timer(0.1).timeout
	print(tombol.button_pressed)
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


var list_jawaban : Array[String] = []
var held_keys = {}

func _input(event):
	if event is InputEventKey:
		var tombol = event.as_text_keycode()
		if event.is_pressed():
			if not held_keys.has(tombol):
				held_keys[tombol] = true
				
				for i in range(list_jawaban.size()):
					if list_jawaban[i] == tombol:
						if self.has_method("_on_jbutton_" + str(i+1) + "_pressed"):
							self.call("_on_jbutton_" + str(i+1) + "_pressed")
		else:
			held_keys.erase(tombol)


func button_benar():
	print("Jawaban Benar")
	sfxbenar.play()
	time_left = total_time
	progressbar.value = total_time
	Audio.stop_sfx()
	
	await get_tree().create_timer(1.0).timeout
	vbenar.play()
	get_tree().current_scene.increase_score()
	get_tree().current_scene.next_question()

func button_salah():
	print("Jawaban Salah")	
	sfxsalah.play()
	await get_tree().create_timer(0.5).timeout
	vsalah.play()
	get_tree().current_scene.decrease_health()


func _on_jbutton_1_pressed():
	jawaban_dipilih = 1
	if banding_pertanyaan():
		button_benar()
	else:
		button_salah()


func _on_jbutton_2_pressed():
	jawaban_dipilih = 2
	if banding_pertanyaan():
		button_benar()
	else:
		button_salah()


func _on_jbutton_3_pressed():
	jawaban_dipilih = 3
	if banding_pertanyaan():
		button_benar()
	else:
		button_salah()
