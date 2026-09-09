extends CanvasLayer


func _process(delta: float) -> void:
	
	if GameManager.is_body_in_area == false:
		GameManager.current_vignette_alpha += delta * GameManager.alpha_lose_speed
	
	elif GameManager.is_body_in_area == true:
		GameManager.current_vignette_alpha -= delta * GameManager.alpha_gain_speed
		
		GameManager.score += delta * GameManager.score_gain_speed
	
	GameManager.current_vignette_alpha = clamp(GameManager.current_vignette_alpha, 0.0, 1.0)
	%DamageViginette.modulate.a = GameManager.current_vignette_alpha
	
	%ScoreLabel.text = "SCORE: " + str(int(GameManager.score))
