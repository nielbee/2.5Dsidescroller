extends State
const SPEED = 2.0
@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
func enter()->void:
	sprite.play("idle")
	
func update(_delta:float)->void:
	body.velocity.x = move_toward(body.velocity.x, 0, SPEED)  # speed must be the same as the const in run state
	if body.direction.x != 0:
		statemanager.change_state("run")
	if Input.is_action_just_pressed("jump") and body.is_on_floor():
		statemanager.change_state("jump")
	if body.is_on_floor() and Input.is_action_just_pressed("block"):
		statemanager.change_state("block")
	if Input.is_action_just_pressed("attack"):
		statemanager.change_state("attack1")
