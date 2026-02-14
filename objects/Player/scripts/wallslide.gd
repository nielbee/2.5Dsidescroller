extends State

@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
const WALLSLIDE_FORCE = 0.2
func enter()->void:
	sprite.play("wall_hang")
	
func update(_delta:float)->void:
	if body.get_wall_normal().x < 0:
		sprite.flip_h = false
	else :
		sprite.flip_h = true
	if body.direction.x == 0 or body.is_on_floor():
		statemanager.change_state("fall")
	body.velocity.y = 0.1
