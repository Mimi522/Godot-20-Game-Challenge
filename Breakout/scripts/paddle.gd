extends CharacterBody2D

const SPEED = 600.0

func _physics_process(_delta):
	var direction = Input.get_axis("Move Left", "Move Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
