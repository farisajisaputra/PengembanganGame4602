extends Area2D

@onready var player = %Player
const GAME_2 = preload("res://scenes/game_2.tscn")

func _on_body_entered(body):
	if body == player:
		get_tree().change_scene_to_packed(GAME_2)
		
	
