@tool
extends Node2D
class_name Block

@onready var sprite: Sprite2D = %Sprite2D

@export var color := Color.WHITE : set = _set_color

var fall_direction = Vector2.DOWN

func _set_color(new_color: Color) -> void:
	color = new_color
	sprite.modulate = color

func _ready() -> void:
	pass # Replace with function body.

func fall() -> void:
	var calculated_position = self.global_position + \
		(fall_direction * Game.FALLING_SPEED * Game.BLOCK_WIDTH)
	
	if calculated_position.y + 10 >= get_viewport().get_visible_rect().end.y:
		return
	
	self.global_position = calculated_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
