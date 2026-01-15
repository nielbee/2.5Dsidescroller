extends State

@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
func enter()->void:
	sprite.play("run")
	
func update(_delta:float)->void:
	if body.direction.x == 0 and body.is_on_floor():
		statemanager.change_state("idle")
	if body.direction.x < 0:
		sprite.flip_h = true
	if body.direction.x > 0:
		sprite.flip_h = false
