extends Popup

@onready var label = $Control/RichTextLabel
@onready var button = $Control/Button
@onready var timer = $Control/Timer
@onready var animation = $Control/AnimationPlayer


func ready():
#	create_fadeout_animation()
	pass
	
func show_message(message):
	label.text = message
	popup_centered()
	timer.start(1)  # Display for 3 seconds
#	animation.play("fade_in")
	
#func _on_timeout():
#	hide()

func _on_timer_timeout():
	hide()

#func create_fadeout_animation():
#	var fade_out = Animation.new()
#	fade_out.length = 1  # Duration of fade out in seconds
#
##	# Add a track for the modulate property of the Label
##	fade_out.track_insert_key(0, label, "modulate:a", 0, 0.0)
##	fade_out.track_insert_key(0, label, "modulate:a", 1, 1.0)
##
##	# Add a track for the visibility property of the Popup
##	fade_out.track_insert_key(0, self, "visible", true, 0.0)
##	fade_out.track_insert_key(0, self, "visible", false, 1.0)
#
#	animation.add_animation("fade_out", fade_out)
#
#	var fade_in = Animation.new()
#	fade_in.length = 0.5  # Duration of fade in in seconds
#
##	# Add a track for the modulate property of the Label
##	fade_in.track_insert_key(0, label, "modulate:a", 0, 0.0)
##	fade_in.track_insert_key(0, label, "modulate:a", 1, 0.5)
#
#	animation.add_animation("fade_in", fade_in)
#
##func _on_button_pressed():
##	hide()


