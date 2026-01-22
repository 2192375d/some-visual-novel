extends MarginContainer

class_name DialogueBox

@export_group("FIXED")
@export var speaker_label: Label
@export var content_label: Label

func change_dialogue(speaker_name: String, content: String) -> void:
	speaker_label.text = speaker_name
	content_label.text = content
