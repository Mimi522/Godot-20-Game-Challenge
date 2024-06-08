extends CharacterBody2D

var direction
var speed = 500

func _ready():
	var angle = randf_range(-PI / 4, PI / 4)
	set_velocity(Vector2(cos(angle) * speed * [-1, 1].pick_random(), sin(angle) * speed))

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		if collision.get_collider().get_class() != "Area2D":
			$BounceSound.play()
		
		velocity = velocity.bounce(collision.get_normal())
		velocity *= 1.03
