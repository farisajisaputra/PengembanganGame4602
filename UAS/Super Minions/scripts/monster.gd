extends Node2D

const SPEED = 150

var direction = 1

@onready var ray_cas_kanan = $RayCasKanan
@onready var ray_cas_kiri = $RayCasKiri
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cas_kanan.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cas_kiri.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	position.x += direction * SPEED * delta
	
