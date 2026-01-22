extends Node

signal hovering(parent)
signal selected(parent)
signal commanded(parent)

@export var selection_data: Selection

@onready var parent = self.get_parent()

func _ready() -> void:
	parent.input_event.connect(_on_input_event)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("select"):
		select()

func select():
	if Selected.current == parent:
		return
	else:
		Selected.set_selected(parent)

func command():
	pass
