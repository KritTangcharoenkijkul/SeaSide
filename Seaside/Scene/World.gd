extends Node2D

var Laser = preload("res://Scene/PlayerLaser.tscn")
var currentscore = 1

func _on_Player_spawn_laser(location):
	var l = Laser.instance()
	l.global_position = location
	add_child(l)
	
func _ready():
	Global.life = 1
	Global.score = 0
	
func score():
	Global.score += 1
	$Cheer.play()
	$Score.text = "LEMONADE SERVED: " + str(Global.score)
	
func _physics_process(delta):
	if Global.life == 2:
		$Sun3.visible = false
		if currentscore == 3:
			Global.score -= 1
			currentscore = 2
			$Score.text = "LEMONADE SERVED: " + str(Global.score)
			$Explosion.play()
	if Global.life == 1:
		$Sun2.visible = false
		if currentscore == 2:
			Global.score -= 1
			currentscore = 1
			$Score.text = "LEMONADE SERVED: " + str(Global.score)
			$Explosion.play()
	if Global.life <= 0:
		$Sun.visible = false
		if currentscore == 1:
			Global.score -= 1
			currentscore = 0
			$Score.text = "LEMONADE SERVED: " + str(Global.score)
			$Explosion.play()
			$GAME.play()
		if Global.highscore < Global.score:
			Global.highscore = Global.score
		$SCREEN.visible = true
		
