extends Node2D

@export var ball_scene: PackedScene
@export var block_scene: PackedScene
@export var score: Label
@export var colors: Array[Color] 

var menu_scene = "res://scenes/main_menu.tscn"

var start_pos = Vector2(120, 120)
var delta_x = 152
var delta_y = 64

const score_txt = "Points: %s"

var player_score := 0
var player_lives := 3

signal ball_spawned(ball)

func _ready():
	update_score()
	spawn_blocks()
	spawn_ball()

func _process(_delta):
	update_score()

func _on_bottom_wall_body_entered(body):
	despawn_ball(body)
	player_lives -= 1

func spawn_ball():
	var ball = ball_scene.instantiate()
	ball.position = Vector2(get_viewport_rect().size.x / 2, 550)
	add_child(ball)
	ball_spawned.emit(ball)

func despawn_ball(body):
	body.queue_free()
	$PointSound.play()
	await get_tree().create_timer(0.1).timeout
	spawn_ball()

func update_score():
	score.text = score_txt % [player_score]

func spawn_blocks():
	for j in range(4):
		for i in range(7):
			var block = block_scene.instantiate()
			block.name = "block_%s_%s" % [i, j]
			block.modulate = colors[j]
			block.scale = block.scale * 3
			block.position = start_pos + Vector2(delta_x * i, delta_y * j)
			$Blocks.add_child(block)

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file(menu_scene)
