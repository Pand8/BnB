extends TextureRect

#var pisang = load("res://Assets/fruit sprites/pngs/banana.png")
#var anggur = load("res://Assets/fruit sprites/pngs/black-berry-dark.png")
#var textures: Array = [pisang, anggur]
#var buah = null
#
#func _ready():
#	set_random_texture()
#
#func set_random_fruit():
#	buah = textures.pick_random()
#
#func set_random_texture():
#	var random_texture = textures[randi() % textures.size()]
#	self.texture = buah
