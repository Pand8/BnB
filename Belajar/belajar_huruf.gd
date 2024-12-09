extends Node2D

@export var sfx: Dictionary = {
	"A": preload("res://Assets/sound/huruf/a.wav"),
	"B": preload("res://Assets/sound/huruf/b.wav"),
	"C": preload("res://Assets/sound/huruf/c.wav"),
	"D": preload("res://Assets/sound/huruf/d.wav"),
	"E": preload("res://Assets/sound/huruf/e.wav"),
	"F": preload("res://Assets/sound/huruf/f.wav"),
	"G": preload("res://Assets/sound/huruf/g.wav"),
	"H": preload("res://Assets/sound/huruf/h.wav"),
	"I": preload("res://Assets/sound/huruf/i.wav"),
	"J": preload("res://Assets/sound/huruf/j.wav"),
	"K": preload("res://Assets/sound/huruf/k.wav"),
	"L": preload("res://Assets/sound/huruf/l.wav"),
	"M": preload("res://Assets/sound/huruf/m.wav"),
	"N": preload("res://Assets/sound/huruf/n.wav"),
	"O": preload("res://Assets/sound/huruf/o.wav"),
	"P": preload("res://Assets/sound/huruf/p.wav"),
	"Q": preload("res://Assets/sound/huruf/q.wav"),
	"R": preload("res://Assets/sound/huruf/r.wav"),
	"S": preload("res://Assets/sound/huruf/s.wav"),
	"T": preload("res://Assets/sound/huruf/t.wav"),
	"U": preload("res://Assets/sound/huruf/u.wav"),
	"V": preload("res://Assets/sound/huruf/v.wav"),
	"W": preload("res://Assets/sound/huruf/w.wav"),
	"X": preload("res://Assets/sound/huruf/x.wav"),
	"Y": preload("res://Assets/sound/huruf/y.wav"),
	"Z": preload("res://Assets/sound/huruf/z.wav")
}

@onready var sfx_player = $CanvasLayer/AudioStreamPlayer2D
@onready var grid_container = $CanvasLayer/GridContainer
var max_button = 26
var tombol = {}
#@onready var tombol = $CanvasLayer/GridContainer/Button

func _ready():
#	var button = $CanvasLayer/Grid/TextureButton
	make_button()
	
	Audio.play_music(preload("res://Assets/sound/cute-funny-kids-music-247318.mp3"))
	Audio.set_music_volume(0.2)
	
	for button_name in sfx.keys():
		var button = grid_container.get_node("Button" + button_name)
		if button:
			button.pressed.connect(tombol_pencet.bind(button_name))
			
#	if grid_container.get_child_count() > 0:
#		var first_button = grid_container.get_child(0)
#		if first_button is Button:
#			first_button.grab_focus()

func _input(event):
	if event is InputEventKey and event.is_pressed():
		var key = event.as_text_keycode()  # Get the key as a string
		if sfx.has(key):  # Check if the button exists for the key
			var button = grid_container.get_node("Button" + key)
			if button:
				button.emit_signal("pressed")
				simulate_button_press(button)

func tombol_pencet(button_name):
	var sfxa = AudioStreamPlayer2D.new()

	if sfx.has(button_name):
		sfx_player.stream = sfx[button_name]
		set_sfx_volume(3)
		sfx_player.play()

var sfx_volume: float = 1.0
func set_sfx_volume(volume: float):
	sfx_volume = clamp(volume, 0, 10) # Clamp to keep between 0 and 1
	sfx_player.volume_db = linear_to_db(sfx_volume)
	
func simulate_button_press(button: Button):
	button.toggle_mode = true
	button.set_pressed(true)
	button.emit_signal("pressed")
	await get_tree().create_timer(0.2).timeout
	button.set_pressed(false)
	button.toggle_mode = false
	
func make_button():
	var huruf = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var default_focus_style: StyleBoxTexture
	var pressed_focus_style: StyleBoxFlat
	
	for i in range(huruf.length()):
		var tombol = Button.new()
		var sfx_player = AudioStreamPlayer2D.new()
		
#		tombol.toggle_mode = true
		tombol.text = huruf[i]
		tombol.name = "Button" + huruf[i]
		tombol.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		tombol.size_flags_vertical = Control.SIZE_EXPAND_FILL
		tombol.theme = load("res://themes/belajar_buttons.tres")
		grid_container.add_child(tombol)
		tombol.action_mode = BaseButton.ACTION_MODE_BUTTON_PRESS
		
#		sfx_player.name = "sfx" + huruf[i]
		
		
		default_focus_style = StyleBoxTexture.new()
		default_focus_style.texture = load("res://Assets/GUI/Math Game Assets/focused.png")

		pressed_focus_style = StyleBoxFlat.new()
		pressed_focus_style.bg_color = Color.TRANSPARENT
		
		tombol.add_theme_stylebox_override("focus", default_focus_style)
		tombol.pressed.connect(_on_button_pressed.bind(tombol))
		tombol.button_up.connect(_on_button_up.bind(tombol))
		tombol.mouse_entered.connect(_on_button_hover.bind(tombol))
		tombol.mouse_exited.connect(_on_button_up.bind(tombol))
		
		if i == 0:
			tombol.grab_focus()
		
		match (i % 5):
			1:
				tombol_merah(tombol)
			2:
				tombol_hijau(tombol)
			3:
				tombol_ungu(tombol)
			4:
				tombol_kuning(tombol)
			_:
				pass
#		tombol.connect("pressed", self, "_on_button_pressed"


func _on_kembali_button_pressed():
	get_tree().change_scene_to_file("res://Menu/menu_pilihan.tscn")

func _on_button_pressed(button):
	var pressed_focus_style = StyleBoxFlat.new()
	pressed_focus_style.bg_color = Color.TRANSPARENT
	
#	for i in range()
	button.add_theme_stylebox_override("focus", pressed_focus_style)

func _on_button_hover(button):
	var pressed_focus_style = StyleBoxFlat.new()
	pressed_focus_style.bg_color = Color.TRANSPARENT

	button.add_theme_stylebox_override("focus", pressed_focus_style)

func _on_button_up(button):
	var default_focus_style = StyleBoxTexture.new()
	default_focus_style.texture = load("res://Assets/GUI/Math Game Assets/focused.png")

	button.add_theme_stylebox_override("focus", default_focus_style)



func tombol_merah(tombol: Button):
	tombol.add_theme_color_override("font_color", Color.html("f86f5a"))
	tombol.add_theme_color_override("font_focus_color", Color.html("f86f5a"))
	tombol.add_theme_color_override("font_hover_color", Color.html("f86f5a"))
	tombol.add_theme_color_override("font_hover_pressed_color", Color.html("f86f5a"))
	tombol.add_theme_color_override("font_pressed_color", Color.html("f86f5a"))

func tombol_hijau(tombol: Button):
	tombol.add_theme_color_override("font_color", Color.html("66c263"))
	tombol.add_theme_color_override("font_focus_color", Color.html("66c263"))
	tombol.add_theme_color_override("font_hover_color", Color.html("66c263"))
	tombol.add_theme_color_override("font_hover_pressed_color", Color.html("66c263"))
	tombol.add_theme_color_override("font_pressed_color", Color.html("66c263"))

func tombol_ungu(tombol: Button):
	tombol.add_theme_color_override("font_color", Color.html("bf8eff"))
	tombol.add_theme_color_override("font_color", Color.html("bf8eff"))
	tombol.add_theme_color_override("font_focus_color", Color.html("bf8eff"))
	tombol.add_theme_color_override("font_hover_color", Color.html("bf8eff"))
	tombol.add_theme_color_override("font_hover_pressed_color", Color.html("bf8eff"))
	tombol.add_theme_color_override("font_pressed_color", Color.html("bf8eff"))

func tombol_kuning(tombol: Button):
	tombol.add_theme_color_override("font_color", Color.html("f8e05a"))
	tombol.add_theme_color_override("font_color", Color.html("f8e05a"))
	tombol.add_theme_color_override("font_focus_color", Color.html("f8e05a"))
	tombol.add_theme_color_override("font_hover_color", Color.html("f8e05a"))
	tombol.add_theme_color_override("font_hover_pressed_color", Color.html("f8e05a"))
	tombol.add_theme_color_override("font_pressed_color", Color.html("f8e05a"))

