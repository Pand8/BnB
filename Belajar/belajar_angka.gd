extends Node2D

@onready var button1 = $CanvasLayer/GridTombol/TextureButton1
@onready var sfx0 = $CanvasLayer/AudioStreamPlayer2D
@onready var sfx1 = $CanvasLayer/AudioStreamPlayer2D2
@onready var sfx2 = $CanvasLayer/AudioStreamPlayer2D3
@onready var sfx3 = $CanvasLayer/AudioStreamPlayer2D4
@onready var sfx4 = $CanvasLayer/AudioStreamPlayer2D5
@onready var sfx5 = $CanvasLayer/AudioStreamPlayer2D6
@onready var sfx6 = $CanvasLayer/AudioStreamPlayer2D7
@onready var sfx7 = $CanvasLayer/AudioStreamPlayer2D8
@onready var sfx8 = $CanvasLayer/AudioStreamPlayer2D9
@onready var sfx9 = $CanvasLayer/AudioStreamPlayer2D10

var focus = false
# Called when the node enters the scene tree for the first time.
func _ready():
	button1.set("texture_focused", load("res://Assets/GUI/Math Game Assets/focused.png"))
	Audio.play_music(preload("res://Assets/sound/cute-funny-kids-music-247318.mp3"))
	Audio.set_music_volume(0.2)
	
	var ind : int = 0
	for i in %GridTombol.get_children():
		var btn : TextureButton = i
		print(i)
		
		btn.set("texture_focused", load("res://Assets/GUI/Math Game Assets/focused.png"))
		btn.pressed.connect(tekan_tombol.bind(i, ind))
#		btn.pressed.connect(simulate_button_press.bind(i))
		btn.pressed.connect(_on_button_pressed.bind(btn))
		btn.button_up.connect(_on_button_up.bind(btn))
		ind += 1

func tekan_tombol(tombol, index:int):
	index = index + 1
	if index == 10:
		index = 0
	print("Tombol " + str(index) + " ditekan")
	var audio : AudioStreamPlayer2D = self["sfx" + str(index)]
	audio.play()
#	print(tombol)
	simulate_button_press(tombol)
#	lepas(%GridTombol.get_children()[index-1])
	
func _on_button_pressed(tombol: TextureButton):
	tombol.set("texture_focused",null)

func _on_button_up(tombol: TextureButton):
	tombol.set("texture_focused", load("res://Assets/GUI/Math Game Assets/focused.png"))
	

func _input(event):
	if event is InputEventKey and event.is_pressed() and not focus:
		var tombol :String = event.as_text_keycode()
		if tombol.is_valid_int():
			var index: = int(tombol) - 1
			
			tekan_tombol(%GridTombol.get_children()[index], index)
#			simulate_button_press()
#			focus = true
#			button1.grab_focus()
			
#			var index = int(tombol) - 1
#			var button = %GridTombol.get_child(index)
#			if button is TextureButton:

func simulate_button_press(button: TextureButton):
	button.set_pressed(true)
	await get_tree().create_timer(0.2).timeout
	button.set_pressed(false)
#	print(button)
#	_on_button_pressed(button)

#var list_tombol : Array[String] = []

func _on_kembali_pressed():
	get_tree().change_scene_to_file("res://Menu/menu_pilihan.tscn")
