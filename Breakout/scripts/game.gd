extends Node2D

@export var ball_scene: PackedScene
@export var score: Label

var menu_scene = "res://scenes/main_menu.tscn"

const score_txt = "%s : %s"

var player1_score := 0
var player2_score := 0

signal ball_spawned(ball)

func _ready():
	if (Global.isPvP):
		$"Player 2".show()
		$"Player 2".process_mode = PROCESS_MODE_INHERIT
		$Bot.hide()
		$Bot.process_mode = PROCESS_MODE_DISABLED
	else:
		$"Player 2".hide()
		$"Player 2".process_mode = PROCESS_MODE_DISABLED
		$Bot.show()
		$Bot.process_mode = PROCESS_MODE_INHERIT
	
	update_score()
	spawn_ball()

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
	ball_spawned.emit(ball)

func despawn_ball(body):
	body.queue_free()
	$PointSound.play()
	await get_tree().create_timer(0.1).timeout
	spawn_ball()

func update_score():
	score.text = score_txt % [player1_score, player2_score]

func _on_reset_pressed():
	player1_score = 0
	player2_score = 0

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file(menu_scene)
