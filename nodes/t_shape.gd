extends Node2D
class_name TShape

@export var block_scene: PackedScene
@export var recipe: ShapeRecipe
@export var color := Color.WHITE : set = _set_color


func _ready() -> void:
	_create_blocks()
	_set_color(color)

func _create_blocks() -> void:
	var current_pos := Vector2(global_position)
	var instance: Block
	
	for row in recipe.shape.split("\n"):
		for column in row:
			match column:
				" ":
					pass
				"X":
					instance = block_scene.instantiate() as Block
					self.add_child(instance)
					instance.global_position = current_pos
				_:
					push_error("invalid character for shape recipe")
			current_pos.x += Game.BLOCK_WIDTH + Game.BLOCK_GAP
		current_pos.x = global_position.x
		current_pos.y += Game.BLOCK_WIDTH + Game.BLOCK_GAP


func _set_color(new_color: Color) -> void:
	color = new_color
	self.get_children().map(
		func (b: Block): b.color = new_color)


func _process(_delta: float) -> void:
	pass
