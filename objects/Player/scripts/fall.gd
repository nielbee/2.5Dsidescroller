extends State

@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
func enter()->void:
	sprite.play("on_air")
	
func update(_delta:float)->void:
	if body.is_on_floor():
		statemanager.change_state("idle")
	
