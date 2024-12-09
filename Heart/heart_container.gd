extends HBoxContainer

@onready var HeartGUIClass = preload("res://Heart/heart_gui.tscn")
# Called when the node enters the scene tree for the first time.

func setMaxHearts(maxs: int):
	for i in range(maxs) :
		var heart = HeartGUIClass.instantiate()
		add_child(heart)
	
func updateHeart(current: int):
	var hearts = get_children()
	
	for i in range(current):
		hearts[i].update(true)
		
	for i in range(current, hearts.size()):
		hearts[i].update(false)
	
