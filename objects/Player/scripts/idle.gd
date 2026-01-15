extends State

@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
func enter()->void:
	sprite.play("idle")
	
func update(_delta:float)->void:
	if body.direction.x != 0:
		statemanager.change_state("run")
