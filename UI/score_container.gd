class_name ScoreContainer extends VBoxContainer

@onready var score_label: Label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	score_label.text = "Score: "
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	score_label.text = "Score: " + str(roundi(ScoreManager.score))
	pass
