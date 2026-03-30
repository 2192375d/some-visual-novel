extends Block

@export var choices: Array[Choice]

# M: tell choice_box to modify and display the choices on the choice box, and show it itself
# M: add the choice message on history box
# W: wait for any choice is clicked
# M: set game state's indices to the target from selected choice
# E: default
# does not need story asset
func execute(interactive_component: InteractiveComponent, history_box: HistoryBox, _story_asset: StoryAsset, story_state: StoryState) -> void:
	var choice_box: ChoiceBox = interactive_component.get_choice_box()
	
	var choice_messages: Array[String]
	
	for choice: Choice in choices:
		choice_messages.append(choice.get_choice_message())
	
	choice_box.display_choice_box(choice_messages)
	
	var choice_index: int = await choice_box.choice_click
	var target_choice: Choice = choices[choice_index]
	
	story_state.set_story_index(target_choice.get_target_index1(),
										  target_choice.get_target_index2())
	
	history_box.add_history_message("you chose \"" + target_choice.get_choice_message() + "\"")
	
	block_complete.emit()

func add_needed_resource(_story_asset: StoryAsset) -> void:
	pass
