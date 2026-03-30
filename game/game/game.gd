# the game's main scene, takes the game state, and proceeds the game by running
# each Block in the story (in the game state)

extends Control

class_name Game

var game_state: GameState
@export var interactive_component: InteractiveComponent
@export var history_box: HistoryBox

# expects a valid loaded game state 
func with_data(new_game_state: GameState) -> Game:
	assert(new_game_state)
	game_state = new_game_state
	return self

func _ready() -> void:
	assert(interactive_component)
	assert(history_box)
	
	game_state.story_complete.connect(_on_story_complete)
	game_state.start_story(interactive_component, history_box)

func _on_story_complete(story_enum: StoryEnum.Enum) -> void:
	SceneManager.switch_scene_to_game(story_enum)
