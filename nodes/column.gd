extends Node2D
class_name Column

#const JEWEL_SCENE: PackedScene = preload("res://nodes/jewel.tscn")
@export var jewel_scene: PackedScene

func _ready() -> void:
	_create_jewels()


func _create_jewels() -> void:
	var current_pos := Vector2(global_position)
	var instance: Jewel
	
	for i in range(3):
		instance = jewel_scene.instantiate() as Jewel
		self.add_child(instance)
		instance.global_position = current_pos
		
		current_pos.y += instance.sprite.texture.get_height() + Game.BLOCK_GAP


func _process(_delta: float) -> void:
	pass
