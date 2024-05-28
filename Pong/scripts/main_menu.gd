extends Control

var game_scene = "res://scenes/game.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_vs_player_button_pressed():
	Global.isPvP = true
	get_tree().change_scene_to_file(game_scene)

func _on_player_vs_ai_button_pressed():
	Global.isPvP = false
	get_tree().change_scene_to_file(game_scene)
