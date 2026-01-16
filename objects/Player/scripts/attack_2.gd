extends State
const SPEED = 0.2
@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
@onready var attackdir := 1

func enter()->void:
	if sprite.flip_h == true:
		attackdir =-1
	else :
		attackdir = 1
	body.velocity.x = attackdir * SPEED
	sprite.play("attack2")
	await  sprite.animation_finished
	statemanager.change_state("idle")
