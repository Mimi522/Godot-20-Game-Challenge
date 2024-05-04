extends CharacterBody2D

const SPEED = 300.0

@export var move_up : StringName
@export var move_down : StringName

func _physics_process(_delta):
	var direction = Input.get_axis(move_up, move_down)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
