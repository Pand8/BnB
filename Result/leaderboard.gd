extends Control

@onready var label1 = $Panel/MarginContainer/VBoxContainer/RichTextLabel
@onready var label2 = $Panel/MarginContainer/VBoxContainer/RichTextLabel2
@onready var label3 = $Panel/MarginContainer/VBoxContainer/RichTextLabel3
@onready var label4 = $Panel/MarginContainer/VBoxContainer/RichTextLabel4
@onready var label5 = $Panel/MarginContainer/VBoxContainer/RichTextLabel5

# Called when the scene is ready
func _ready():
	Score.add_score(Global.player_name, Global.score, Global.type)
	update_score_board()
	
	if Global.player_name == "Admin":
		$Button.visible = true 
#	reset_leaderboard()
#	var parent = get_parent()
#	parent.create_star()
# Update the high score board with the top 5 scores

func update_score_board():
	var scores = Score.get_high_scores(Global.type)
	
	# Update the labels with the top 5 scores
	if scores.size() > 0: label1.text = format_score(scores[0])
	if scores.size() > 1: label2.text = format_score(scores[1])
	if scores.size() > 2: label3.text = format_score(scores[2])
	if scores.size() > 3: label4.text = format_score(scores[3])
	if scores.size() > 4: label5.text = format_score(scores[4])
	
#	print("Sorted Scores: ", scores)
#	print("Sorted Scoressssss: ", scores.size())
func reset_leaderboard():
	label1.text = ""
	label2.text = ""
	label3.text = ""
	label4.text = ""
	label5.text = ""
# Helper function to format a score entry as "Name: Score"
func format_score(entry: Dictionary) -> String:
	return entry["name"] + ": " + str(entry["score"])


#func _on_finish_game():
#	Score.add_score(GloFal.player_name, Global.score)
#	update_score_board()


func _on_button_pressed():
	Score.reset_scores()
