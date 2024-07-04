extends CharacterBody2D

var base_speed = 300.0
var current_speed = base_speed
const JUMP_VELOCITY = -530.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_boost = false
var boost_timer = 0.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var sfx_lompat = $sfx_lompat

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("lompat") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sfx_lompat.play()

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("kiri", "kanan")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animation
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)

	move_and_slide()

	# Handle speed boost duration
	if is_boost:
		boost_timer -= delta
		if boost_timer <= 0:
			is_boost = false
			current_speed = base_speed

func add_speed_boost(boost_amount, duration):
	current_speed += boost_amount
	is_boost = true
	boost_timer = duration
