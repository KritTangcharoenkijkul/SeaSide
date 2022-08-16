extends Node2D


var spawn_positions = null

var Enemy = preload("res://Scene/Enemy.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()
	

func _physics_process(delta):

	if Global.score == 0:
		$SpawnTimer.wait_time = 2.0
	else:
		$SpawnTimer.wait_time = 2.0 / Global.score


func spawn_enemy():
	var index = randi() % spawn_positions.size()
	var enemy = Enemy.instance()
	enemy.global_position = spawn_positions[index].global_position
	enemy.connect("enemy_died", get_tree().current_scene, "score")
	add_child(enemy)

func _on_SpawnTimer_timeout():
	spawn_enemy()  
