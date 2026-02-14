extends State

@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
#@onready bufferslide := false
const SPEED = 2.3
const JUMP_VELOCITY = 40
const WALLJUMP_INIT_FORCE = 10


func enter()->void:
	$"../../slideParticle".emitting = true
	
	sprite.play("jump")

	body.velocity.x = -body.get_wall_normal().x*40
func update(_delta:float)->void:
	
	#body.velocity.x = body.direction.x * SPEED

	if body.is_on_floor():
		statemanager.change_state("idle")
		
	
