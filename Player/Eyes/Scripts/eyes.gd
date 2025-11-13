class_name Eyes extends Area2D

var is_staring_at_sun : bool = false
var is_blocked : bool = false

@export var eye_limit_max : float = 100

var current_eye_limit : float = 0

signal max_eye_reached

var previous_area : Area2D = null
var current_area: Area2D = null

@onready var cpu_particles_2d : CPUParticles2D = $CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#PlayerManager.player_eyes = self
	
	area_entered.connect(_area_entered)
	area_exited.connect(_area_exited)
	
	#cpu_particles_2d.emitting = false
	
	# Make it visible again
	# Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if is_staring_at_sun and not is_blocked:
		current_eye_limit = clampf(current_eye_limit + (_delta * 10), 0, eye_limit_max)
		self.global_position.x = lerpf(self.global_position.x, randf_range(self.global_position.x -10, self.global_position.x + 10), current_eye_limit/100)
		self.global_position.y = lerpf(self.global_position.y, randf_range(self.global_position.y -10, self.global_position.y + 10), current_eye_limit/100)
	else:
		current_eye_limit = clampf(current_eye_limit - (_delta * 10), 0, eye_limit_max)

	self.global_position.x = lerpf(self.global_position.x, get_global_mouse_position().x, 0.5)
	self.global_position.y = lerpf(self.global_position.y, get_global_mouse_position().y, 0.5)
	
	if current_eye_limit >= eye_limit_max:
		max_eye_reached.emit()
		cpu_particles_2d.emitting = true
		cpu_particles_2d.amount = 20
	elif current_eye_limit >= eye_limit_max / 2:
		cpu_particles_2d.emitting = true
		cpu_particles_2d.amount = 10
	elif current_eye_limit >= eye_limit_max / 5:
		cpu_particles_2d.emitting = true
		cpu_particles_2d.amount = 4
	else:
		cpu_particles_2d.emitting = false
		cpu_particles_2d.amount = 4
	
	pass

func _area_entered(area: Area2D) -> void:
	if area is Obstacle:
		is_staring_at_sun = false
		is_blocked = true
	if area is Sun:
		is_staring_at_sun = true
	#if previous_area == area:
		#return
	#
	#previous_area = current_area
	#current_area = area
	#
	#if current_area is Sun:
		#is_blocked = false
		#is_staring_at_sun = true
	#elif current_area is Obstacle:
		#is_blocked = true
		#is_staring_at_sun = false

func _area_exited(area: Area2D) -> void:
	if area is Obstacle:
		is_blocked = false
	if area is Sun:
		is_staring_at_sun = false
	for a in get_overlapping_areas():
		if a is Sun:
			is_staring_at_sun = true
		#if a is Obstacle:
			#is_blocked = true
			#is_staring_at_sun = false
	#if previous_area is Sun and area is Obstacle:
		#is_staring_at_sun = true
