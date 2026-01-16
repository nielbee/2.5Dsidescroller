extends State
const SPEED = 2.6
@onready var sprite := $"../../sprites"
@onready var body := $"../.."
@onready var statemanager := $".."
@onready var slidedirection := -1
@onready var changestate := false
@onready var bufferjump := false

func enter()->void:
	sprite.play("block")
	
func update(_delta:float)->void:
	body.velocity.x = 0
	if Input.is_action_just_released("block"):
		statemanager.change_state("idle")
