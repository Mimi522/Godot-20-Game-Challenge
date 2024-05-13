extends CharacterBody2D

var direction
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	var angle = randf_range(-PI / 4, PI / 4)
	direction = Vector2(cos(angle), sin(angle))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(direction * delta * speed)
	if collision != null:
		if collision.get_collider().get_class() == "StaticBody2D":
			direction = Vector2(direction.x, -direction.y)
		if collision.get_collider().get_class() == "CharacterBody2D":
			direction = Vector2(-direction.x, direction.y)
			speed *= 1.1
