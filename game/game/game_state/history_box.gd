# the history box ui in the game
extends ScrollContainer

class_name HistoryBox

@onready var history: Array[String] = []
@export var label: Label

func _ready() -> void:
	label.text = ""

# takes a message, outputs it, and prints a new line right after
func add_history_message(message: String) -> void:
	history.append(message)
	label.text += (message + "\n")
