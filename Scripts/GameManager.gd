extends Node3D
var is_body_in_area : bool = false
var current_vignette_alpha : float = 0
var alpha_lose_speed : float = 0.075
var alpha_gain_speed : float = 0.25

# Skor Değişkenleri
var score : float = 0.0
var score_gain_speed : float = 100.0

func _physics_process(delta: float) -> void:
	if current_vignette_alpha >= 1.0:
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")

func reset_game() -> void:
	is_body_in_area = false
	current_vignette_alpha = 0.0
	score = 0.0
