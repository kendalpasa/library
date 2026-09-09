extends Node2D

func _ready() -> void:
	Input.mouse_mode = Input.MouseMode.MOUSE_MODE_VISIBLE

func _on_button_button_down() -> void:
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
