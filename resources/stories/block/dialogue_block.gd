extends Block

class_name DialogueBlock

@export var speaker_enum: CharacterEnum.Enum = CharacterEnum.Enum.NARRATOR
@export var content: String

# M: tell dialogue_box to modify it's speaker to speaker from speaker_enum, it's content 
#    to the content
# M: add message to history
# W: wait for dialogue box to emit box_click signal
# M: set story state (i, j) to (i, j+1)
# E: default behaviour
func execute(interactive_component: InteractiveComponent, history_box: HistoryBox, story_asset: StoryAsset, story_state: StoryState) -> void:
	# M
	var dialogue_box: DialogueBox = interactive_component.get_dialogue_box()
	var speaker_name = story_asset.get_character(speaker_enum).get_character_name()
	dialogue_box.set_dialogue_speaker(speaker_name)
	dialogue_box.set_dialogue_content(content)
	
	# M
	history_box.add_history_message(speaker_name + ": " + content)
	
	# W
	await dialogue_box.box_click
	
	# M
	story_state.set_index1(story_state.get_index1())
	story_state.set_index2(story_state.get_index2() + 1)
	
	# E
	block_complete.emit()

func add_needed_resource(story_asset: StoryAsset) -> void:
	story_asset.add_character(speaker_enum)
