# responsible for all the modifications to the interaction components to the 
# user
# (interaction between game_presenter with all the interaction components is
# kind of a facade... but it won't affect the outside!)

extends Node

#class_name GamePresenter

#@export var dialogue_box: DialogueBox
#@export var choice_box: ChoiceBox
#var game_state

#func _ready() -> void:
#	pass
#
#func process_dialogue_block(dialogue_block: DialogueBlock) -> void:
#	var speaker: Character = CharacterDB.get_character(dialogue_block.speaker_enum)
#	var speaker_name: String = speaker.get_character_name()
#	dialogue_box.set_dialogue_speaker(speaker_name)
#	dialogue_box.set_dialogue_content(dialogue_block.content)
#	
#	dialogue_box.box_click.connect(func(): dialogue_block.action_complete.emit())
#
#func change_background() -> void:
#	pass
