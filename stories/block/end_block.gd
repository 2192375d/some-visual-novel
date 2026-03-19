extends Block

class_name EndBlock

@export var target_index: int = 0

func execute(game: Game) -> void:
	var game_state: GameState = game.get_game_state()
	assert(target_index < game_state.story.next_stories.size())
	game_state.complete_story(target_index)
	
	# does not emit block complete
