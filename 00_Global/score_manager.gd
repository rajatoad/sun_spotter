extends Node

var score : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().process_frame
	PlayerManager.player_eyes.max_eye_reached.connect(_clear_score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerManager.player_eyes.is_staring_at_sun:
		score += delta * 1.5
	else:
		score -= delta * 0.5
	pass

func _clear_score() -> void:
	score = 0

#func _increase_score(increment)
