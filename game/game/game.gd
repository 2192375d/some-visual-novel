# the game's main scene, takes the game state, and proceeds the game by running
# each Block in the story (in the game state)

extends Control

class_name Game

var game_state: GameState
@export var dialogue_box: DialogueBox
@export var choice_box: ChoiceBox

func with_data(new_game_state: GameState) -> Game:
	game_state = new_game_state
	return self

func _ready() -> void:
	game_state.story_complete.connect(_on_story_complete)
	execute_current_block()

func _on_current_block_complete() -> void:
	execute_current_block()

func execute_current_block() -> void:
	var current_block: Block = game_state.get_current_block()
	current_block.block_complete.connect(_on_current_block_complete)
	current_block.execute(self)

func _on_story_complete(story_enum: StoryEnum.Enum) -> void:
	SceneManager.switch_scene(SceneEnum.Enum.LOADING_SCREEN, [story_enum])

func get_game_state() -> GameState:
	return game_state

func get_dialogue_box() -> DialogueBox:
	return dialogue_box

func get_choice_box() -> ChoiceBox:
	return choice_box
