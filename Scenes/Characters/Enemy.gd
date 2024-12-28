extends KinematicBody2D

var player = null
var velocity = Vector2()
var speed = 200
var vida = 10

func _ready():
	pass
	
	player = get_tree().get_nodes_in_group("PJ")[0]
	
	
func _process(delta):
	if vida <= 0:
		GlobalPlayerInteraction.enemies -= 1
		self.queue_free()
		
func _physics_process(delta):
	if player != null:
		velocity = (player.position - position).normalized() * speed

	move_and_slide(velocity, Vector2.UP)
	
func damage(dano):
	vida -= dano


func _on_TimerKill_timeout():
	pass # Replace with function body.


func _on_VisibilityEnabler2D_screen_entered():
	pass # Replace with function body.


func _on_VisibilityEnabler2D_screen_exited():
	pass # Replace with function body.
