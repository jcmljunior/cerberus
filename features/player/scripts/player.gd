extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -450.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimationPlayer.play("player_jump")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x, direction * SPEED, .5)
		$AnimationPlayer.play("player_run")
		
		if not $Sprite2D.flip_h:
			$Sprite2D.flip_h = true
	
	elif Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, direction * SPEED, .5)
		$AnimationPlayer.play("player_run")
		
		if $Sprite2D.flip_h:
			$Sprite2D.flip_h = false
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimationPlayer.play("player_idle")

	move_and_slide()
