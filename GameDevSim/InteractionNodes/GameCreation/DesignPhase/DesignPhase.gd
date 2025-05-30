extends Node3D

@export var gridWidth : int
@export var gridHeight : int
var gridDic : Dictionary

@onready var tilePrefab : PackedScene = preload("res://InteractionNodes/GameCreation/Tiles/Tile.tscn")
var activeTile : Node3D

@onready var cam : Camera3D = get_tree().current_scene.get_node("Camera3D")

func _ready() -> void:
	CreateGrid()
	ConnectInputs()

func CreateGrid(): 
	for x in (gridWidth + 1): # We do gridwidth + 1 so the grid doesn't start on 0, 0 (yes I know this makes me a normie now shut up)
		x *= 1.25
		for y in (gridHeight + 1):
			y *= 1.25
			var newTile : Node3D = tilePrefab.instantiate()
			newTile.position = Vector3(x, 0, y)
			newTile.designPhase = self
			
			$TileHolder.add_child(newTile)
			
	cam.position = Vector3(float(gridWidth) / 2, 4, (float(gridHeight) / 2) + 1)

func ConnectInputs():
	InputManager.leftClickSignal.connect(FlipTile)
	
func FlipTile():
	if activeTile:
		activeTile.anim.play("Flip")
