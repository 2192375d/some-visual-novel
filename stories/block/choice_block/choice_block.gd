extends Block

@export var choices: Array[Choice]

func execute(game: Game) -> void:
	var choice_box: ChoiceBox = game.get_choice_box()
	
	var choice_messages: Array[String]
	
	for choice: Choice in choices:
		choice_messages.append(choice.get_choice_message())
	
	choice_box.display_choice_box(choice_messages)
	
	var choice_index: int = await choice_box.choice_click
	var target_choice: Choice = choices[choice_index]
	
	game.get_game_state().set_story_index(target_choice.get_target_index1(),
										  target_choice.get_target_index2())
