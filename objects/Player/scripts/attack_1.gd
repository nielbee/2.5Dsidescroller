extends State
const SPEED = 0.2
@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
@onready var attackdir := 1
@onready var attackbuffer:= false
func enter()->void:
	if sprite.flip_h == true:
		attackdir =-1
	else :
		attackdir = 1
	body.velocity.x = attackdir * SPEED
	sprite.play("attack1")
	await  sprite.animation_finished
	if attackbuffer:
		statemanager.change_state("attack2")
	else:
		statemanager.change_state("idle")

func update(_delta:float)->void:
	if Input.is_action_just_pressed("attack"):
		attackbuffer = true

func exit()->void:
	attackbuffer = false
