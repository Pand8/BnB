extends Button

var default_focus_style : StyleBoxFlat
var pressed_focus_style : StyleBoxFlat

# Called when the node enters the scene tree for the first time.
func _ready():
	default_focus_style = StyleBoxFlat.new()
	default_focus_style.bg_color = Color.RED
		
	pressed_focus_style = StyleBoxFlat.new()
	pressed_focus_style.bg_color = Color.TRANSPARENT
		
	add_theme_stylebox_override("focus", default_focus_style)


func _on_pressed():
#	set_texture_focused(null)
	add_theme_stylebox_override("focus", pressed_focus_style)


func _on_button_up():
	add_theme_stylebox_override("focus", default_focus_style)
