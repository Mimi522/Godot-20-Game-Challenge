extends Control

@export var game_menu: Panel
@export var score_history: Panel

var game_scene = "res://scenes/game.tscn"	

func _on_play_button_pressed():
	get_tree().change_scene_to_file(game_scene)

func _on_score_history_button_pressed():
	game_menu.hide()
	score_history.show()

func _on_button_pressed():
	game_menu.show()
	score_history.hide()
