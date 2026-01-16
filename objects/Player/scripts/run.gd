extends State
const SPEED = 2.0

@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
func enter()->void:
	sprite.play("run")
	
func update(_delta:float)->void:
	body.velocity.x = body.direction.x * SPEED 
	if body.direction.x == 0 and body.is_on_floor():
		statemanager.change_state("idle")
	if body.direction.x < 0:
		sprite.flip_h = true
	if body.direction.x > 0:
		sprite.flip_h = false
	if Input.is_action_just_pressed("jump") and body.is_on_floor():
		statemanager.change_state("jump")
	if Input.is_action_just_pressed("slide") and body.is_on_floor():
		statemanager.change_state("slide")
	if Input.is_action_just_pressed("block") and body.is_on_floor():
		statemanager.change_state("block")
	if Input.is_action_just_pressed("attack"):
		statemanager.change_state("attack1")
