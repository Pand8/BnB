extends Panel

@onready var sprite1 = $Sprite2D2
#@onready var sprite2:TextureRect = $Sprite2D2
#@onready var sprite3:TextureRect = $Sprite2D3

#var texture = 0
#	set_random_texture() 


func _ready():
	var texture = get_parent().buah 
	$Sprite2D2.texture = texture

#func update(whole: bool):
#	return
#	if whole: sprite1.visible = 1
#	else: sprite1.visible = 0 
