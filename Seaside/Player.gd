extends Area2D
class_name Player

onready var muzzle = $Muzzle

signal lifeloss
signal spawn_laser(location)
var speed = 300
var input_vector = Vector2.ZERO

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	global_position += input_vector * speed * delta
	if global_position.x < 0:
		global_position.x = 0
	if global_position.y < 0:
		global_position.y = 0
	if global_position.y > 750:
		global_position.y = 750
	if global_position.x > 1500:
		global_position.x = 1500
	if Input.is_action_just_pressed("ui_select"):
		shoot_laser()



func take_damage(damage):
	Global.life -= damage
	if Global.life <= 0:
		queue_free()
	


func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)
		
		
func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)
