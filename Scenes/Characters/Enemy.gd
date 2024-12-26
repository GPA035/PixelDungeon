extends KinematicBody2D

var player = null
var velocity = Vector2()
var speed = 200

func _ready():
	pass
	
	player = get_tree().get_nodes_in_group("PJ")[0]
	
	
func _process(delta):

	if position < player.position:
		position.y += player.position.y * delta * 2
		position.x += player.position.x * delta * 2
		
	if position > player.position:
		position.y -= player.position.y * delta * 2
		position.x -= player.position.x * delta * 2

	move_and_slide(position)
