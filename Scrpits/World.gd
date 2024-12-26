extends Node2D

var player = preload("res://Scenes/Characters/PJ.tscn").instance()
var enemy = preload("res://Scenes/Characters/Enemy.tscn").instance()

var oleada = 0
var enemies = 0
var ini_oleada = false
var time_spawn = 5

onready var timer_spawn = $Timers/TimerSpawn
onready var timer_oleada = $Timers/TimerOleada
onready var cuenta_atras = $"UI/CuentaAtras"

func _ready():
	get_node("Instancias_Mobs").add_child(player)
	timer_oleada.start(1)

func _process(delta):
	cuenta_atras.text = str(timer_spawn.time_left)
	
	match oleada:
		0:
			if ini_oleada:
				ini_oleada = false
				enemies = 10
				spawn_enemies()
			
		1:
			if ini_oleada:
				ini_oleada = false
				enemies = 15
				spawn_enemies()
		2:
			if ini_oleada:
				ini_oleada = false
				enemies = 25
				spawn_enemies()
		3:
			if ini_oleada:
				ini_oleada = false
				enemies = 35
				spawn_enemies()
		4:
			if ini_oleada:
				ini_oleada = false
				enemies = 50
				spawn_enemies()
			
	print(str(enemies))

func spawn_enemies():
	if enemies > 0:
		timer_spawn.start(time_spawn)
	

func _on_TimerOleada_timeout():
	print("lo iso")
	ini_oleada = true


func _on_TimerSpawn_timeout():
	enemies -= 1
	spawn_enemies()
	add_child(enemy)
