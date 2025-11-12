class_name UIManager extends CanvasLayer

@onready var score_container : ScoreContainer = $Control/ScoreContainer
@onready var eye_limit_container : EyeLimitContainer = $Control/EyeLimitContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerManager.player_eyes:
		eye_limit_container.setup_ui()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
