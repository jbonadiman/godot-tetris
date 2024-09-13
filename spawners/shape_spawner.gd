extends Node

@export var shapes: Array[ShapeRecipe]
@export var shape_scene: PackedScene

@onready var spawn_timer: Timer = %SpawnTimer

var main_scene: Node2D

const colors: Array[Color] = [
	Color.RED,
	Color.PURPLE,
	Color.FOREST_GREEN,
	Color.YELLOW,
	Color.ORANGE,
]


func _ready() -> void:
	spawn_timer.timeout.connect(_on_spawn_timeout)
	main_scene = get_tree().get_first_node_in_group("current_scene")


func _on_spawn_timeout() -> void:
	spawn_shape()


func spawn_shape() -> void:
	if shapes.is_empty():
		push_error("no shape to instantiate")
	var instance: TShape = shape_scene.instantiate()
	instance.recipe = shapes.pick_random()
	instance.color = colors.pick_random()
	
	main_scene.add_child(instance)
	instance.global_position = Vector2(
		randi() % int(get_viewport().get_visible_rect().end.x), -50
	)
	


func _process(_delta: float) -> void:
	pass
