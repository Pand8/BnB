extends Node2D

func _ready():
	# Create a Viewport
	var viewport = SubViewport.new()
	viewport.size = Vector2(200, 100)  # Set the size of the viewport
#    viewport.use_debanding = SubViewport.
	
	# Create a Control node and apply StyleBoxFlat
	var control = Control.new()
	control.custom_minimum_size = Vector2(200, 100)  # Set size for the control
	control.theme = load("res://content_angka1.tres")  # Load your custom theme
	
	# Optionally, set the stylebox directly if not using a theme
	var styleboxpress = load("res://new_theme.tres::StyleBoxFlat_pqwes")
	var styleboxnormal = load("res://new_theme.tres::StyleBoxFlat_qtvxd")
	var stylebox = load("res://new_theme.tres::StyleBoxFlat_fsihl")
#    stylebox.bg_color = Color(0.8, 0.3, 0.3)  # Example color
#    stylebox.border_width_top = 5
#    control.add_stylebox_override("panel", stylebox)
	
	# Add the control to the viewport
	viewport.add_child(control)
	control.custom_minimum_size = viewport.size

	# Update and render the viewport
	viewport.UPDATE_ALWAYS  # Ensure everything is rendered

	# Get the texture from the viewport
	var texture = viewport.get_texture()

	# Save the texture as a PNG file
	var image = texture.get_image()
	image.flip_y()  # Flip the image vertically (Godot's rendering system flips images by default)
	image.save_png("res://exported_styleboxflat.png")

	print("Image saved successfully")
