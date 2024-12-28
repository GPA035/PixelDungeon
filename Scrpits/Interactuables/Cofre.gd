extends StaticBody2D

onready var animation = $AnimationPlayer

var permiso = false
var tomar_cofre = true

#inicio para comenzar con el script(posiblemente esto quede descartado)
func iniciar_action():
	animation.play("Aparecer")


func _process(delta):
#funcion para abrir el cofre 
	if Input.is_action_just_pressed("F") && permiso && tomar_cofre:
		animation.play("Abriendo")
		tomar_cofre = false


func _on_Area2D_body_entered(body):
	if body.is_in_group("PJ"):
		permiso = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("PJ"):
		permiso = false

#Esto se llama despues de terminar la animacion de abriendo
func dar_item():
	self.queue_free()
	pass
