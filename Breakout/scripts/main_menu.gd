extends Control

var game_scene = "res://scenes/game.tscn"

func _on_player_vs_player_button_pressed():
	get_tree().change_scene_to_file(game_scene)

func _on_player_vs_ai_button_pressed():
	get_tree().change_scene_to_file(game_scene)
