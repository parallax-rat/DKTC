extends Node2D
@onready var arrival_progress_bar: ProgressBar = $ArrivalProgressBar
@onready var arrival: Timer = $Arrival

func _ready() -> void:
	arrival_progress_bar.max_value = arrival.wait_time

func _process(_delta: float) -> void:
	arrival_progress_bar.value = arrival.wait_time - arrival.time_left
	
