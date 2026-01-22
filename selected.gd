extends Node

signal new_selection(current_selection)
signal cleared_selection()
signal started_hovering(current_hovering)
signal cleared_hovering()


var current_selection: Node = null
var previous_selection: Node = null
var current_hovering: Node = null
var previous_hovering: Node = null


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("select"):
		if is_instance_of(current_hovering,TYPE_OBJECT):
			update_selection(current_hovering)
		else:
			update_selection(null)


func update_hovering(new: Variant):
	if is_instance_of(new,TYPE_NIL):
		current_hovering = null
		cleared_hovering.emit()
	elif is_instance_of(new,TYPE_OBJECT):
		current_hovering = new
		started_hovering.emit(new)


func update_selection(new: Variant):
	update_previous_selection()
	if is_instance_of(new,TYPE_NIL):
		current_selection = null
		cleared_selection.emit()
	elif is_instance_of(new,TYPE_OBJECT):
		current_selection = new
		new_selection.emit()


func update_previous_selection():
	previous_selection = current_selection


func get_selected_name() -> StringName:
	return current_selection.Selection.Data["name"]


func get_selected_location() -> Vector2:
	return current_selection.Selection.Data["location"]


func get_selected_velocity() -> Vector2:
	return current_selection.Selection.Data["velocity"]
