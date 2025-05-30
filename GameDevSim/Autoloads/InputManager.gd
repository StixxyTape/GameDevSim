extends Node

signal leftClickSignal

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Left Click"):
		leftClickSignal.emit()
