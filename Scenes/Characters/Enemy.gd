extends KinematicBody2D

var player = null
var velocity = Vector2()
var speed = 200

func _ready():
	pass
	
func _process(delta):
	player = get_tree().get_nodes_in_group("PJ")[0]
	
	if player != null:
		velocity = position - player.position * delta
		
	move_and_slide(velocity)
