extends Node2D
class_name Jewel

const SQUARE_SHAPE := preload("res://assets/element_grey_square.png")
const POLYGON_SHAPE := preload("res://assets/element_grey_polygon.png")
const DIAMOND_SHAPE := preload("res://assets/element_grey_diamond.png")

# TODO: Change to typed version (Dictionary[Color, Texture2D]), once it's available
# https://github.com/godotengine/godot-proposals/issues/56
const PREDEFINED_SHAPES: Dictionary = {
	Color.RED: DIAMOND_SHAPE,
	Color.PURPLE: DIAMOND_SHAPE,
	Color.GREEN: SQUARE_SHAPE,
	Color.DEEP_SKY_BLUE: SQUARE_SHAPE,
	Color.YELLOW: POLYGON_SHAPE,
	Color.ORANGE: POLYGON_SHAPE,
}

@onready var sprite: Sprite2D = %Sprite2D
@onready var area: Area2D = %Area2D

@export var color := Color.WHITE : set = _set_color

var fall_direction := Vector2.DOWN
var colliding := false


func _set_color(new_color: Color) -> void:
	if not PREDEFINED_SHAPES.has(new_color):
		push_error("unrecognized color/shape for jewel")
		return

	color = new_color
	sprite.modulate = color
	sprite.texture = PREDEFINED_SHAPES[color]


#func _init() -> void:
	#self.color = PREDEFINED_SHAPES.keys().pick_random()
	#return
	#
	##self.color = init_color


func _ready() -> void:
	self.color = PREDEFINED_SHAPES.keys().pick_random()
	area.body_entered.connect(_on_body_entered)


func fall() -> void:
	if colliding:
		return
	
	var calculated_position = self.global_position + \
		(fall_direction * Game.FALLING_SPEED * Game.BLOCK_WIDTH)
	
	if calculated_position.y + 10 >= get_viewport().get_visible_rect().end.y:
		return
	
	self.global_position = calculated_position


func _on_body_entered(_other: Node2D) -> void:
	colliding = true


func _process(_delta: float) -> void:
	pass
