extends Node2D

@onready var play_button = $CanvasLayer/Control/TextureButton
@onready var quit_menu = $CanvasLayer/Control/Popup2
@onready var error_label = $CanvasLayer/Control/Label
@onready var line_edit = $CanvasLayer/Control/LabelNama/LineEdit


func _ready():
	line_edit.grab_focus()
	quit_menu.hide()
	
	$AudioStreamPlayer2D.play()
	
	

	
	Audio.play_music(preload("res://Assets/sound/happy-uplifting-ukulele-kids-short-version-217004.mp3"))
	Audio.set_music_volume(0.5)
	
	if Global.player_name != "":
		line_edit.text = Global.player_name
		if validate_name(Global.player_name):
			play_button.disabled = false
		else:
			play_button.disabled = true
	else:
		play_button.disabled = true

#LineEdit
func validate_name(name)-> bool:
	# Check if the name is empty
	if name.strip_edges() == "":
		error_label.text = "Nama tidak boleh kosong!"
		return false
	
	if name.length() < 3:
		error_label.text = "Nama harus lebih dari 3 huruf!"
		return false
	
	if name.length() > 20:
		error_label.text = "Nama terlalu panjang!"
		return false
	
	if not has_valid_characters(name):
		error_label.text = "Pakai huruf saja, jangan aneh-aneh!"
		return false
	
	return true

func has_valid_characters(name) -> bool:
	var allowed_characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
	for chara in name:
		if allowed_characters.find(chara) == -1:
			return false
	return true

func _on_line_edit_text_changed(new_text):
	if validate_name(new_text):
		Global.player_name = new_text
#		print("Player Name: ", new_text)
		play_button.disabled = false
		error_label.text = ""
	else:
		play_button.disabled = true
#		error_label.text = "Nama harus benar dan lebih dari 3 huruf"

func _on_line_edit_text_submitted(new_text):
	if validate_name(new_text):
		_on_texture_button_pressed()

#button
func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Menu/menu_pilihan.tscn")

#func _on_button_2_pressed():
#	get_tree().change_scene_to_file("res://Belajar/menu_belajar.tscn")
	
func _on_quit_pressed():
	quit_menu.show()
	
#popup
func _on_ya_pressed():
	get_tree().quit()

func _on_tidak_pressed():
	quit_menu.hide()


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D2.play()
