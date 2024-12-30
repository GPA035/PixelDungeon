extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Animacion").play("Disparo") # disparar bala (reproducir animacion)


#eliminar bala
func _on_Animacion_animation_finished(anim_name):
	queue_free() # eliminar bala
