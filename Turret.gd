extends Node2D

var bullet_scene = preload("res://Bullet.tscn")
@onready var barrel = $Barrel
var player = null

var shoot_timer = 0.0
const SHOOT_COOLDOWN = 1.0

func _on_aggro_zone_body_entered(body):
	player = body

func _on_aggro_zone_body_exited(body):
	player = null

func _process(delta):
	shoot_timer -= delta
	if player != null:
		barrel.look_at(player.global_position)
		if shoot_timer <= 0:
			shoot_timer = SHOOT_COOLDOWN
			
			var direction = (player.global_position - global_position).normalized()
			var bullet = bullet_scene.instantiate()
			bullet.init(direction)
			add_child(bullet)
