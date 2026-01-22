extends Panel

@onready var selected: Label = $MarginContainer/VBoxContainer/Selected/Selected
@onready var selected_value: Label = $MarginContainer/VBoxContainer/Selected/SelectedValue
@onready var location: Label = $MarginContainer/VBoxContainer/Location/Location
@onready var location_value: Label = $MarginContainer/VBoxContainer/Location/LocationValue
@onready var velocity: Label = $MarginContainer/VBoxContainer/Velocity/Velocity
@onready var velocity_value: Label = $MarginContainer/VBoxContainer/Velocity/VelocityValue

func _ready() -> void:
	if Selected.current_selection == null:
		hide()
	else:
		show()
	Selected.new_selection.connect(update_display)
	Selected.cleared_selection.connect(clear_display)

func _physics_process(_delta: float) -> void:
	if is_instance_of(Selected.current_selection,Node2D):
		update_location()
	if is_instance_of(Selected.current_selection,CharacterBody2D):
		update_velocity()

func clear_display():
	hide()

func update_display():
	update_selected()
	show()

func update_selected():
	selected_value.text = Selected.current_selection.name

func update_location():
	location_value.text = str(Selected.current_selection.global_position)

func update_velocity():
	velocity_value.text = str(Selected.current_selection.velocity)
