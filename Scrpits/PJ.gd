extends KinematicBody2D

var speed = 20000

var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _process(delta):
	move(delta)

func move(delta):
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed * delta
	move_and_slide(velocity)
