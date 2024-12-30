extends KinematicBody2D

const speed = 20000 # velocidad del player
var velocity = Vector2.ZERO # movimientos en vectores


func _process(delta):
	move(delta)

	if Input.is_action_just_pressed("disparar"):
		var bala = preload("res://Scenes/Characters/Bala.tscn").instance() # nambre de la bala
		get_parent().add_child(bala)
		bala.position.x = self.position.x
		bala.position.y = self.position.y
		bala.look_at(get_global_mouse_position())
		
		

func move(delta):
	velocity = Input.get_vector("A","D","W","S") * speed * delta
	move_and_slide(velocity)
