extends Panel

@onready var sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
	
func update(whole: bool):
	if whole: sprite.visible = 1
	else: sprite.visible = 0 
