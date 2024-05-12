extends Node2D

@export var ball_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_ball()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_dead_zone_body_entered(body):
	body.queue_free()
	spawn_ball()
	
func spawn_ball():
	var ball = ball_scene.instantiate()
	ball.position = get_viewport_rect().size / 2
	add_child(ball)
