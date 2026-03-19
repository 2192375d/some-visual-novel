# responsible for the user interaction of the dialogue box. To be more precise:
# - the info displayed on the box
# - detecting user clicking on it

extends MarginContainer

class_name DialogueBox

@export var speaker_label: Label
@export var content_label: Label

signal box_click

func _ready() -> void:
	pass

func set_dialogue_speaker(speaker_name: String) -> void:
	speaker_label.text = speaker_name

func set_dialogue_content(content: String) -> void:
	content_label.text = content

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			box_click.emit()
