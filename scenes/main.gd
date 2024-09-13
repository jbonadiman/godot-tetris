extends Node2D

@onready var fall_timer: Timer = %FallTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	fall_timer.timeout.connect(_on_fall_timeout)


func _on_fall_timeout() -> void:
	for block: Block in get_tree().get_nodes_in_group("blocks"):
		block.fall()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
