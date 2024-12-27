extends Node2D

var player = preload("res://Scenes/Characters/PJ.tscn").instance()

var oleada = 0
var enemies_spawn = 0
var ini_oleada = false
var time_spawn = 5

onready var timer_spawn = $Timers/TimerSpawn
onready var timer_oleada = $Timers/TimerOleada
onready var cuenta_atras = $"UI/CuentaAtras"

func _ready():
	get_node("Instancias_Mobs").add_child(player)
	timer_oleada.start(1)

func _process(delta):
	cuenta_atras.text = str(Engine.get_frames_per_second())
	
	match oleada:
		1:
			if ini_oleada:
				ini_oleada = false
				enemies_spawn = 2
				spawn_enemies()
				GlobalPlayerInteraction.enemies = enemies_spawn
		2:
			if ini_oleada:
				ini_oleada = false
				enemies_spawn = 15
				spawn_enemies()
				GlobalPlayerInteraction.enemies = enemies_spawn
		3:
			if ini_oleada:
				ini_oleada = false
				enemies_spawn = 25
				spawn_enemies()
				GlobalPlayerInteraction.enemies = enemies_spawn
		4:
			if ini_oleada:
				ini_oleada = false
				enemies_spawn = 35
				spawn_enemies()
				GlobalPlayerInteraction.enemies = enemies_spawn
		5:
			if ini_oleada:
				ini_oleada = false
				enemies_spawn = 50
				spawn_enemies()
				GlobalPlayerInteraction.enemies = enemies_spawn
			
	if GlobalPlayerInteraction.enemies == 0 && timer_oleada.time_left == 0:
		timer_oleada.start(20)
			
	print(str(oleada))

func spawn_enemies():
	if enemies_spawn >= 1:
		timer_spawn.start(time_spawn)
	else:
		timer_spawn.stop()
	

func _on_TimerOleada_timeout():
	print("lo iso")
	oleada += 1
	ini_oleada = true


func _on_TimerSpawn_timeout():
	var enemy = preload("res://Scenes/Characters/Enemy.tscn").instance()
	enemies_spawn -= 1
	spawn_enemies()
	get_node("Instancias_Mobs").add_child(enemy)
