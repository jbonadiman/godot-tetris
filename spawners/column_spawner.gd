extends Node

const COLUMN_SCENE := preload("res://nodes/column.tscn")

@onready var spawn_timer: Timer = %SpawnTimer

var main_scene: Node2D

func _ready() -> void:
	spawn_timer.timeout.connect(_on_spawn_timeout)
	main_scene = get_tree().get_first_node_in_group("current_scene")

func _on_spawn_timeout() -> void:
	spawn_shape()


func spawn_shape() -> void:
	var instance: Column = COLUMN_SCENE.instantiate() as Column
	
	main_scene.add_child(instance)
	instance.global_position = Vector2(
		randi() % int(get_viewport().get_visible_rect().end.x), -50
	)


func _process(_delta: float) -> void:
	pass
