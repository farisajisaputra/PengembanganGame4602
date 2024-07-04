extends Label

@onready var player = %Player

func _process(delta):
	if player.is_boost:
		text = "Boost Time: %.1f" % player.boost_timer
	else:
		text = ""
