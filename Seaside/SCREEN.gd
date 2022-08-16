extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	
	
	$ColorRect/Score2.text = str(float(Global.score))
	if(Global.score == Global.highscore):
		$ColorRect/Score4.text = "! NEW HI-SCORE !"
	else:
		$ColorRect/Score4.text = "HI-SCORE: " + str(Global.highscore)
		
	
	

func _on_Button_pressed():
	get_tree().reload_current_scene()
