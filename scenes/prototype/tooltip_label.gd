class_name TooltipLabel
extends Label

func _ready() -> void:
	hide()
	self_modulate.a = 0

func show_tooltip():
	show()
	var t = get_tree().create_tween()
	t.tween_property(self,"self_modulate:a",1,0.2)


func hide_tooltip():
	var t = get_tree().create_tween()
	t.tween_property(self,"self_modulate:a",0,0.2)
	await t.finished
	hide()
