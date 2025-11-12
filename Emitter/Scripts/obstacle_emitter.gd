class_name ObstacleEmitter extends Node2D

@export var obstacle : Obstacle = null

var _timer : float = 0

@export var move_speed : float = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_timer += delta
	if _timer > 3:
		obstacle.global_position.x = obstacle.global_position.x + (delta * move_speed)
	pass
