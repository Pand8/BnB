extends Node

# Function to render StyleBoxFlat to PNG
func export_stylebox_to_png(stylebox: StyleBoxFlat, size: Vector2, file_path: String):
	# Create an off-screen viewport
	var viewport = SubViewport.new()
	viewport.size = size
	viewport.render_target_v_flip = true  # Flip the render target vertically for proper orientation
#    viewport.usage = Viewport.USAGE_2D
	
	# Create a control to render the stylebox into the viewport
	var control = Control.new()
	control.rect_min_size = size
	control.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	control.size_flags_vertical = Control.SIZE_EXPAND_FILL
	control.theme = load("res://content_angka1.tres")
	
	# Set the control to use the stylebox
	control.add_theme_stylebox_override("panel", stylebox)
	viewport.add_child(control)
	
	# Wait for one frame to make sure the viewport renders the content
	await get_tree().idle_frame
	
	# Get the texture from the viewport
	var texture = viewport.get_texture()
	
	# Save the texture as PNG
	var img = texture.get_image()
	img.save_png(file_path)

# Example usage
func _ready():
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = Color.red
	stylebox.border_color = Color.black
	stylebox.border_width_top = 2
	stylebox.border_width_bottom = 2
	stylebox.border_width_left = 2
	stylebox.border_width_right = 2
	
	export_stylebox_to_png(stylebox, Vector2(128, 128), "user://exported_stylebox.png")
