extends CharacterBody2D

const MOCK_DATA: JSON = preload("res://assets/names/MOCK_DATA.json")

@onready var tooltip_label: TooltipLabel = $TooltipLabel

func _ready() -> void:
	var rand_name = MOCK_DATA.data.pick_random()
	name = rand_name["name"]
	tooltip_label.text = name

func _on_mouse_entered() -> void:
	Selected.update_hovering(self)
	tooltip_label.show_tooltip()


func _on_mouse_exited() -> void:
	Selected.update_hovering(null)
	tooltip_label.hide_tooltip()
