extends MeshInstance3D

var spawn_positions : Array[Vector3] = [
	Vector3(18, 1.737, -35.7),
	Vector3(18, 1.737, -40.1), 
	Vector3(18, 1.737, -44.5),
	Vector3(18, 1.737, -48.6),
	Vector3(18, 1.737, -52.9),
	Vector3(18, 1.737, -57.2),
	Vector3(18, 1.737, -61.6),
	Vector3(18, 1.737, -65.8),
	Vector3(18, 1.737, -70.0),
	Vector3(18, 1.737, -74.4),
	Vector3(18, 1.737, -79.3), 
	
	Vector3(29.7, 1.737, -35.7),
	Vector3(29.7, 1.737, -40.1), 
	Vector3(29.7, 1.737, -44.5),
	Vector3(29.7, 1.737, -48.6),
	Vector3(29.7, 1.737, -52.9),
	Vector3(29.7, 1.737, -57.2),
	Vector3(29.7, 1.737, -61.6),
	Vector3(29.7, 1.737, -65.8),
	Vector3(29.7, 1.737, -70.0),
	Vector3(29.7, 1.737, -74.4),
	Vector3(29.7, 1.737, -79.3), 
	
]

func _ready() -> void:
	# 20 saniyede bir tetiklenecek bir Timer oluşturuyoruz
	var timer = Timer.new()
	timer.wait_time = 8.0
	timer.autostart = true
	# Timer süresi dolduğunda çalışacak fonksiyonu bağlıyoruz
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	_on_timer_timeout()

func _on_timer_timeout() -> void:
	# Listeden rastgele bir konum seç
	var random_pos = spawn_positions.pick_random()
	
	# Objenin zaten bulunduğu noktayı tekrar seçmesini engellemek için küçük bir kontrol:
	# Eğer seçilen yeni nokta, şu anki noktaya çok yakınsa (aynıysa), farklı bir tane bulana kadar tekrar seç
	while random_pos.distance_to(global_position) < 0.1:
		random_pos = spawn_positions.pick_random()
		
	# Objenin dünyadaki konumunu seçilen yeni konuma taşı
	global_position = random_pos

func _on_objee_area_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		GameManager.is_body_in_area = true

func _on_objee_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		GameManager.is_body_in_area = false
