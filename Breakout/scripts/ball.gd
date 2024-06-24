extends CharacterBody2D

var direction
var speed = 300

func _ready():
	var angle = randf_range(PI/6, PI - PI/6)
	set_velocity(Vector2(cos(angle) * speed, -sin(angle) * speed))

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		if collision.get_collider().name.contains("block"):
			collision.get_collider().queue_free()
			Global.on_block_destroyed.emit()
		
		$BounceSound.play()
		velocity = velocity.bounce(collision.get_normal())
		velocity *= 1.03
