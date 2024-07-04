extends Label
var score = 0

@onready var score_label = %ScoreLabel


func add_point():
	score += 100
	score_label.text = "Score : " + str(score) 
