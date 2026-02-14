extends State

@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
#@onready bufferslide := false
const SPEED = 2.3
const JUMP_VELOCITY = 3
const WALLJUMP_INIT_FORCE = 10


func enter()->void:
	$"../../slideParticle".emitting = true
	body.velocity.y += JUMP_VELOCITY
	sprite.play("jump")
	#await sprite.animation_finished
	#sprite.play("on_air")

func update(_delta:float)->void:
	
	body.velocity.x = body.direction.x * SPEED
	if body.is_on_wall():
		statemanager.change_state("wallslide")
	if body.is_on_floor():
		statemanager.change_state("idle")
		
	
