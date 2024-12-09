extends VBoxContainer

var textures: Array = []
var buah = null
@onready var ObjectGUIClass = preload("res://Object/object.tscn")

class buahContent extends HBoxContainer:
	var buah

func _ready():
	pass


func setMaxObjects(maxs: int):
	clear_objects()
	print("Max objects to display: ", maxs)
	const max_col := 5
	var rows := ceili(maxs as float/max_col as float)

	#duplicatehbox
	for i in range(rows):
		var dup_hbox:= buahContent.new()
		dup_hbox.alignment = BoxContainer.ALIGNMENT_CENTER
		dup_hbox.buah = self.buah
		dup_hbox.set_size(Vector2(900, 400))
		var num := max_col if i != rows - 1 or maxs % max_col == 0 else maxs % max_col
		#object
		for j in range(num):
			var object = ObjectGUIClass.instantiate()
#			print("Instantiated object with texture: ", object.get_children())
			dup_hbox.add_child(object)
#			object.update(true)
		#dup_hbox.add_child()
		# add_child(object)
		self.add_child(dup_hbox)
		

#func updateObject(current: int): #, object_type: String
#	var objects = get_children()
#	return
##	for i in range(objects.size()):
##		objects[i].hide()  # Hide all objects initially
#
#	for i in range(current):
#		objects[i].update(true)
##		objects[i].show()
##		match object_type:
##			apple:
##				objects[i].set_texture(objects[i].sprite1)
##			banana:
##				objects[i].set_texture(objects[i].sprite2)
##			melon:	
##				objects[i].set_texture(objects[i].sprite1)
#
#	for i in range(current, objects.size()):
#		objects[i].update(false)

func clear_objects():
	for child in get_children():
		remove_child(child)
		child.queue_free()

func set_random_fruit():
	var buah_baru = textures.pick_random()
#	if buah_baru == buah:
#		set_random_fruit()
#		return
#	buah = buah_baru

func set_random_texture():
	var random_texture = textures[randi() % textures.size()]
	self.texture = buah
	buah.clear_objects()

#func set_max_columns(columns: int):
#	max_col = columns
#	update_layout()

#func update_layout():
#	.columns = max_col

#func setMaxObjects(max: int):				
#	print("Setting max objects to: ", max)			
#	queue_free_children()  # Clear existing objects			
#	for i in range(max):			
#		var object = ObjectGUIClass.instantiate()		
#		add_child(object)		
#				
#func updateObject(current: int):				
#	print("Updating objects to: ", current)			
#	var objects = get_children()			
#	for i in range(current):			
#		if i < objects.size():		
#			objects[i].visible = true	
#		else:		
#			print("Object index out of range: ", i)	
#				
#	for i in range(current, objects.size()):			
#		objects[i].visible = false		
#				
#func queue_free_children():				
#	for child in get_children():			
#		child.queue_free()		


#	const max_col := 5
#	print("Test")
#	var rows := ceili(maxs as float/max_col as float)
#	print(rows)
#	for i in range(rows):
#		var object = ObjectGUIClass.instantiate()
#		var dup_hbox:= buahContent.new()
#		dup_hbox.buah = object
#		dup_hbox.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
#		var num := max_col if i != rows -1 else maxs % max_col
#		print(num)
#		for j in range(num):
#			dup_hbox.add_child(object)	
#
#		self.add_child(dup_hbox)
#		object.update(true) 
	
#func updateObject(current: int): #, object_type: String
#	var objects = get_children()
#	return
##	for i in range(objects.size()):
##		objects[i].hide()  # Hide all objects initially
#
#	for i in range(current):
#		objects[i].update(true)
##		objects[i].show()
##		match object_type:
##			"apple":
##				objects[i].set_texture(objects[i].sprite1)
##			"banana":
##				objects[i].set_texture(objects[i].sprite2)
##			"melon":
##				objects[i].set_texture(objects[i].sprite1)
#
#	for i in range(current, objects.size()):
#		objects[i].update(false)
