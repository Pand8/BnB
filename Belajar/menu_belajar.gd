extends Node2D

@onready var button1 = $CanvasLayer/HBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	button1.grab_focus() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_kembali_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn") # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Belajar/belajar_angka.tscn") # Replace with function body.


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Belajar/belajar_huruf.tscn")
