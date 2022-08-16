extends Area2D

var speed = 1000

func _physics_process(delta):
	global_position.x += speed * delta
	
	if global_position.x > 5000:
		queue_free()

func _on_PlayerLaser_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)
		queue_free()
