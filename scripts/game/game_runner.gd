extends Node
class_name GameRunner

@onready var current_subchapter: Subchapter = Cache.get_subchapter()

@export_group("FIXED")
@export var dialogue_box: DialogueBox
@export var character_illustration: TextureRect

signal subchapter_complete

func process_block(current_block: Block):
	if current_block is DialogueBlock:
		dialogue_box.change_dialogue(
			Cache.get_character(current_block.character_enum).
			character_name, current_block.content
		)
		character_illustration.texture = Cache.get_character(current_block.character_enum).illustrations[0]
	if current_block is ChoiceBlock:
		print("choice block not handled yet")

func _ready() -> void:
	process_block(current_subchapter.blocks[Cache.block_index])

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm"):
		Cache.increment_block_index()
		
		if Cache.get_block_index() >= current_subchapter.blocks.size():
			subchapter_complete.emit()
			print("chapter complete")
			return
		
		process_block(current_subchapter.blocks[Cache.get_block_index()])
