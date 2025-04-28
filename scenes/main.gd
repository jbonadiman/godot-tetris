extends Node2D

@onready var fall_timer: Timer = %FallTimer

@export var jewel_scene: PackedScene


func _init() -> void:
	pass


func _ready() -> void:
	var jewel := jewel_scene.instantiate() as Jewel
	self.add_child(jewel)
	
	jewel.global_position = Vector2(200,200)
	#fall_timer.timeout.connect(_on_fall_timeout)


func _on_fall_timeout() -> void:
	for jewel: Jewel in get_tree().get_nodes_in_group("jewels"):
		jewel.fall()


func _process(_delta: float) -> void:
	pass
