extends CharacterBody2D

var direction
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	var angle = randf_range(-PI / 4, PI / 4)
	direction = Vector2(cos(angle), sin(angle))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(direction * delta * speed)
