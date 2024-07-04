extends Area2D

@onready var score_label = %ScoreLabel
@onready var animatin_player = $AnimationPlayer

func _on_body_entered(body):
	score_label.add_point()
	animatin_player.play("pickupp")
	  
	
