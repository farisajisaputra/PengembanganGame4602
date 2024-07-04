extends Area2D

@onready var player = %Player

func _on_body_entered(body):
	if body == player:
		print("speedboost")
		player.add_speed_boost(300, 10) # Add 300 speed for 10 seconds
		queue_free()
		
	
