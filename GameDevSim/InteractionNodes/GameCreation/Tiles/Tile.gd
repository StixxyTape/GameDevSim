extends Node3D

@onready var anim : AnimationPlayer = get_node("AnimationPlayer")
var designPhase : Node3D

func MouseEntered() -> void:
	designPhase.activeTile = self
	get_child(0).get_active_material(0).albedo_color.r += 0.2

func MouseExited() -> void:
	designPhase.activeTile = null
	get_child(0).get_active_material(0).albedo_color.r -= 0.2
