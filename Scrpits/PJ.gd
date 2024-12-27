extends KinematicBody2D

var speed = 20000

var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _process(delta):
	move(delta)

	if Input.is_action_just_pressed("disparar"):
		var bala = preload("res://Scenes/Characters/Bala.tscn").instance()
		get_parent().add_child(bala)
		
		bala.position -= get_global_mouse_position()
		
func move(delta):
	velocity = Input.get_vector("A","D","W","S") * speed * delta
	move_and_slide(velocity)
