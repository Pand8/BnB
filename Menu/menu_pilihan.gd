extends Node2D

@onready var angka_belajar = $CanvasLayer/Container/PanelBelajar/MarginContainer/ContainerBelajar/ContainerBelajar/ContainerAngka/Button
@onready var huruf_belajar = $CanvasLayer/Container/PanelBelajar/MarginContainer/ContainerBelajar/ContainerBelajar/ContainerHuruf/Button2
@onready var angkabtn = $CanvasLayer/Container/PanelBermain/MarginContainer/ContainerBermain/ContainerBermain/ContainerAngka3/angkabtn
@onready var hurufbtn = $CanvasLayer/Container/PanelBermain/MarginContainer/ContainerBermain/ContainerBermain/ContainerHuruf3/hurufbtn
@onready var angkabtn2 = $CanvasLayer/Container/PanelBermain/MarginContainer/ContainerBermain/ContainerBermain/ContainerAngka2/angkabtn
@onready var hurufbtn2 = $CanvasLayer/Container/PanelBermain/MarginContainer/ContainerBermain/ContainerBermain/ContainerHuruf2/hurufbtn

var focus = false

func _ready():
	
	Audio.play_music(preload("res://Assets/sound/cute-funny-kids-music-247318.mp3"))
	Audio.set_music_volume(0.5)
#	if Audio.music_player.stream != Audio.bgm:
#		Audio.play_music(preload("res://Assets/sound/happy-uplifting-ukulele-kids-short-version-217004.mp3"))  # Start bgm1 fresh only if it's not playing.
#	elif !Audio.music_player.is_playing():
#		Audio.music_player.play()
#	Audio.play_music(preload("res://Assets/sound/happy-uplifting-ukulele-kids-short-version-217004.mp3"))


func _on_kembali_pressed():
	get_tree().change_scene_to_file("res://Menu/menu_utama.tscn") # Replace with function body.

func _input(event):
	if event is InputEventKey and event.is_pressed() and not focus:
		if event.keycode == KEY_RIGHT:
			focus = false
			hurufbtn2.grab_focus()
		elif event.keycode == KEY_DOWN:
			focus = false
			angkabtn.grab_focus()
		else:
			focus = true
			angka_belajar.grab_focus()

#belajarbutton
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Belajar/belajar_angka.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Belajar/belajar_huruf.tscn")


#bermainbutton
func _on_angkabtn_pressed():
	get_tree().change_scene_to_file("res://Bermain/Level_Angka.tscn")

func _on_angkabtn2_pressed():
	get_tree().change_scene_to_file("res://Bermain2/Level_Angka2.tscn")
	
func _on_hurufbtn_pressed():
	get_tree().change_scene_to_file("res://Bermain/Level_Huruf.tscn")

func _on_hurufbtn2_pressed():
	get_tree().change_scene_to_file("res://Bermain2/Level_Huruf2.tscn")


func _on_button_button_down():
	angka_belajar.set("texture_focused",null)

func _on_button_2_button_down():
	huruf_belajar.set("texture_focused",null)

func _on_angkabtn_button_down():
	angkabtn.set("texture_focused",null)

func _on_hurufbtn_button_down():
	hurufbtn.set("texture_focused",null)

func _on_angkabtn2_button_down():
	angkabtn2.set("texture_focused",null)

func _on_hurufbtn2_button_down():
	hurufbtn2.set("texture_focused",null)



func _on_button_focus_entered():
	$BelajarAngka.play()
func _on_button_2_focus_entered():
	$BelajarHuruf.play()


func _on_angkabtn_focus_entered():
	$BermainAngka1.play()
func _on_angkabtn2_focus_entered():
	$BermainAngka2.play()
func _on_hurufbtn_focus_entered():
	$BermainHuruf1.play()
func _on_hurufbtn2_focus_entered():
	$BermainHuruf2.play()
