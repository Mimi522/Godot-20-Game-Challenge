extends CharacterBody2D

const SPEED = 300.0

var ball: CharacterBody2D
var initial_pos

func _ready():
	initial_pos = position.y

func _physics_process(_delta):
	if (ball == null):
		return
	
	if (ball.velocity.x <= 0):
		if (position.y - initial_pos > 2):
			velocity.y = -SPEED
		elif (position.y - initial_pos < -2):
			velocity.y = SPEED
		else:
			velocity.y = 0
	else:
		if (ball.velocity.y > 0 && ball.position.y > position.y):
			velocity.y = SPEED
		elif (ball.velocity.y < 0 && ball.position.y < position.y):
			velocity.y = -SPEED
		else:
			velocity.y = 0
	
	move_and_slide()

func _on_game_ball_spawned(_ball):
	ball = _ball
