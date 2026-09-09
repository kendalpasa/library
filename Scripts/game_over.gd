extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MouseMode.MOUSE_MODE_VISIBLE
	%gameoverLabel.text = "Score: " + str(int(GameManager.score))

func _on_button_button_down() -> void:
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
