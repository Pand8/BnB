class_name Content2
extends CanvasLayer

#memanggil label dari list pertanyaan
@onready var pertanyaan = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/Pertanyaan
@onready var label_pertanyaan :RichTextLabel = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/Pertanyaan2
@onready var label_opsi1 :Button = $Control/HBoxContainer/VBoxContainer3/JbuttonContainer2/jbutton1
@onready var label_opsi2 :Button = $Control/HBoxContainer/VBoxContainer3/JbuttonContainer2/jbutton2
@onready var label_opsi3 :Button = $Control/HBoxContainer/VBoxContainer3/JbuttonContainer2/jbutton3

@onready var gambar = $Control/HBoxContainer/VBoxContainer3/Panel/MarginContainer/VBoxContainer/Sprite2D4

#--------------------- SFX ---------------------#
@onready var sfxbenar : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sfxsalah : AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var vbenar : AudioStreamPlayer2D = $AudioStreamPlayer2D3
@onready var vsalah : AudioStreamPlayer2D = $AudioStreamPlayer2D4
#--------------------- SFX ---------------------#

@onready var level_timer = $LevelTimer
@onready var progressbar = $Control/HBoxContainer/VBoxContainer2/label

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
	pass
#	var remaining_time = level_timer.time_left
	
#func get_texture():
#	return textures.pop_front()
	
func set_objects(texture): #,object_type:String
#	print("Setting objects to: ", texture)
	gambar.texture = texture
#	gambar.hewan = get_texture()

func banding_pertanyaan() -> bool:
	return jawaban_benar == jawaban_dipilih

#memunculkan isi dari label dan button
func ganti_pertanyaan(parameter : String):
	label_pertanyaan.text = "[center]" + parameter + "[/center]"
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

func _input(event):
	if event is InputEventKey and event.is_pressed():
		var tombol = event.as_text_keycode()
		for i in range(list_jawaban.size()):
			if list_jawaban[i] == tombol:
				if self.has_method("_on_jbutton_" + str(i+1) + "_pressed"):
					self.call("_on_jbutton_" + str(i+1) + "_pressed")


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
