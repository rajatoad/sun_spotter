class_name EyeLimitContainer extends VBoxContainer

@onready var eye_limit_label: Label = $EyeLimitLabel
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var blindness: ColorRect = $"../Blindness"

var max_blind_color : Color = Color(0, 0, 0, 1)
var min_blind_color : Color = Color(1, 1, 1, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerManager.player_eyes:
		setup_ui()

	pass # Replace with function body.

func setup_ui() -> void:
	progress_bar.max_value = PlayerManager.player_eyes.eye_limit_max
	progress_bar.value = 0
	blindness.color = min_blind_color

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if PlayerManager.player_eyes:
		progress_bar.value = PlayerManager.player_eyes.current_eye_limit
		#blindness.color = Color(0, 0, 0, 1)
		var blindness_alpha = clampf((PlayerManager.player_eyes.current_eye_limit / 100), 0, 1)
		blindness.color = Color(0, 0, 0, blindness_alpha)
