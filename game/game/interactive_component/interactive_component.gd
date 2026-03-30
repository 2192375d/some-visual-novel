extends Node

class_name InteractiveComponent

@export var dialogue_box: DialogueBox
@export var choice_box: ChoiceBox

func get_dialogue_box() -> DialogueBox:
	assert(dialogue_box)
	return dialogue_box

func get_choice_box() -> ChoiceBox:
	assert(choice_box)
	return choice_box
