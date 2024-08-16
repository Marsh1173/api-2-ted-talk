extends Node2D

const SPEED = 500
var direction = Vector2(0,0)

func init(_direction):
	direction = _direction

func _process(delta):
	global_transform.origin += direction * (delta * SPEED)
