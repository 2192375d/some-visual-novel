extends Block

class_name DialogueBlock

@export var speaker_enum: CharacterEnum.Enum = CharacterEnum.Enum.NARRATOR
@export var content: String

func execute(game: Game) -> void:
	var dialogue_box: DialogueBox = game.get_dialogue_box()
	var speaker_name = CharacterDB.get_character(speaker_enum).get_character_name()
	dialogue_box.set_dialogue_speaker(speaker_name)
	dialogue_box.set_dialogue_content(content)
	
	await dialogue_box.box_click
	
	var game_state: GameState = game.get_game_state()
	game_state.set_story_index(game_state.get_story_index().get_index1(),
							   game_state.get_story_index().get_index2() + 1)
	
	block_complete.emit()
