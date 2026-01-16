extends State
const SPEED = 2.6
@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
@onready var slidedirection := -1
@onready var changestate := false
@onready var bufferjump := false

func enter()->void:
	if sprite.flip_h == true:
		slidedirection =-1
	else :
		slidedirection = 1
	body.velocity.x = slidedirection * SPEED
	sprite.play("slide")
	await sprite.animation_finished
	changestate = true
	
func update(_delta:float)->void:
	if Input.is_action_pressed("jump"):
		#changestate = true
		bufferjump = true
	if body.is_on_floor() and changestate:
		if bufferjump:
			statemanager.change_state("jump")
		else:
			statemanager.change_state("idle")
	
func exit()->void:
	bufferjump = false
	changestate = false
