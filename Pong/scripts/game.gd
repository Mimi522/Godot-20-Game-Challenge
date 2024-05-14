extends Node2D

@export var ball_scene: PackedScene
@export var score: Label

const score_txt = "%s : %s"

var player1_score := 0
var player2_score := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score()
	spawn_ball()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_score()

func _on_dead_zone_body_entered_left(body):
	player2_score += 1
	despawn_ball(body)

func _on_dead_zone_body_entered_right(body):
	player1_score += 1
	despawn_ball(body)

func spawn_ball():
	var ball = ball_scene.instantiate()
	ball.position = get_viewport_rect().size / 2
	add_child(ball)

func despawn_ball(body):
	body.queue_free()
	await get_tree().create_timer(0.1).timeout
	spawn_ball()

func update_score():
	score.text = score_txt % [player1_score, player2_score]
