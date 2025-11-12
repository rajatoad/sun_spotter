class_name Level extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for n in get_children():
		if n is Sun:
			EntityManager.sun = n
		if n is Eyes:
			PlayerManager.player_eyes = n
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
