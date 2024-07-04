extends Control

# This function is called every frame
func _process(delta):
	# Check if the "ui_accept" action (typically the Enter key) was just pressed
	if Input.is_action_just_pressed("ui_accept"):
		# Make this Control node visible
		visible = true
		# Pause the game
		get_tree().paused = true

# This function is called when the "Continue" button is pressed
func _on_continue_pressed():
	# Hide this Control node
	hide()
	# Resume the game
	get_tree().paused = false

# This function is called when the "Quit" button is pressed
func _on_quit_pressed():
	# Resume the game (in case it was paused)
	get_tree().paused = false
	# Quit the game
	get_tree().quit()

# This function is called when the new pause button is pressed
func _on_pause_button_pressed():
	# Pause the game
	get_tree().paused = true
	# Make this Control node visible (or handle as needed)
	visible = true


func _on_resized():
	pass # Replace with function body.
