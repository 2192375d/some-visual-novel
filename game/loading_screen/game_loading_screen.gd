# performs loading for the game
# called through start_loading function, taking the story_enum as input

extends Control

class_name GameLoadingScreen

@export var progress_bar: ProgressBar

# loading requires:
# - story: 5%
# - story_assets: 80%
# - initiate story_state: 2%
# - game scene instantiation: 13%
const STORY_PROPORTION: float = 0.05
const STORY_ASSETS_PROPORTION: float = 0.80
const INITATE_STORY_STATE_PROPORTION: float = 0.02
const GAME_SCENE_INSTANTIATION_PROPORTION: float = 0.13
const ASSET_BLOCKS_PER_FRAME: int = 32

signal loading_complete(game: Node)

enum LoadingStage {
	NONE = -1,
	STORY = 0,
	ASSETS = 1,
	STORY_STATE = 2,
	GAME_SCENE = 3,
}

var progress: Array[float] = [0.0]
var loading_stage: LoadingStage = LoadingStage.NONE

var story_uid: StringName = &""
var game_scene_uid: StringName = &""

var story: Story = null
var story_asset: StoryAsset = null
var story_state: StoryState = null
var game_state: GameState = null

var num_block: int = 0
var current_block: int = 0
var current_index1: int = 0
var current_index2: int = 0

func _ready() -> void:
	progress_bar.value = 0.0
	set_process(loading_stage != LoadingStage.NONE)

func _process(_delta: float) -> void:
	assert(loading_stage in LoadingStage.values() && loading_stage != LoadingStage.NONE)
	var status: ResourceLoader.ThreadLoadStatus
	match loading_stage:
		LoadingStage.STORY:
			status = ResourceLoader.load_threaded_get_status(story_uid, progress)
			if status == ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
				push_error("invalid story resource %s" % story_uid)
				loading_complete.emit(null)
				set_process(false)
				return
			if status == ResourceLoader.THREAD_LOAD_FAILED:
				push_error("unable to load %s" % story_uid)
				loading_complete.emit(null)
				set_process(false)
			elif status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
				progress_bar.value = progress[0] * STORY_PROPORTION
			elif status == ResourceLoader.THREAD_LOAD_LOADED:
				story = ResourceLoader.load_threaded_get(story_uid)
				assert(story)
				
				story_asset = StoryAsset.new()
				num_block = 0
				current_block = 0
				current_index1 = 0
				current_index2 = 0
				for i in range(story.get_num_story_line()):
					num_block += story.get_story_line_size(i)
				
				game_scene_uid = SceneManager.scene_dictionary.get(SceneEnum.Enum.GAME)
				assert(game_scene_uid)
				var error: Error = ResourceLoader.load_threaded_request(game_scene_uid)
				if error != OK:
					push_error("unable to request game scene %s" % game_scene_uid)
					loading_complete.emit(null)
					set_process(false)
					return
				
				loading_stage = LoadingStage.ASSETS
		LoadingStage.ASSETS:
			if current_index1 >= story.get_num_story_line():
				progress_bar.value = STORY_PROPORTION + STORY_ASSETS_PROPORTION
				loading_stage = LoadingStage.STORY_STATE
				return
			
			var processed_block: int = 0
			while processed_block < ASSET_BLOCKS_PER_FRAME && current_index1 < story.get_num_story_line():
				var block: Block = story.get_block(current_index1, current_index2)
				block.add_needed_resource(story_asset)
				current_block += 1
				processed_block += 1
				
				current_index2 += 1
				if current_index2 >= story.get_story_line_size(current_index1):
					current_index1 += 1
					current_index2 = 0
			
			if num_block > 0:
				progress_bar.value = STORY_PROPORTION + STORY_ASSETS_PROPORTION * float(current_block) / num_block
			else:
				progress_bar.value = STORY_PROPORTION + STORY_ASSETS_PROPORTION
			
			if current_index1 >= story.get_num_story_line():
				progress_bar.value = STORY_PROPORTION + STORY_ASSETS_PROPORTION
				loading_stage = LoadingStage.STORY_STATE
		LoadingStage.STORY_STATE:
			story_state = StoryState.new()
			game_state = GameState.new(story, story_state, story_asset)
			progress_bar.value = STORY_PROPORTION + STORY_ASSETS_PROPORTION + INITATE_STORY_STATE_PROPORTION
			loading_stage = LoadingStage.GAME_SCENE
		LoadingStage.GAME_SCENE:
			status = ResourceLoader.load_threaded_get_status(game_scene_uid, progress)
			if status == ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
				push_error("invalid game scene resource %s" % game_scene_uid)
				loading_complete.emit(null)
				set_process(false)
				return
			if status == ResourceLoader.THREAD_LOAD_FAILED:
				push_error("unable to load %s" % game_scene_uid)
				loading_complete.emit(null)
				set_process(false)
			elif status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
				progress_bar.value = STORY_PROPORTION + STORY_ASSETS_PROPORTION + INITATE_STORY_STATE_PROPORTION + progress[0] * GAME_SCENE_INSTANTIATION_PROPORTION
			elif status == ResourceLoader.THREAD_LOAD_LOADED:
				var game_scene: PackedScene = ResourceLoader.load_threaded_get(game_scene_uid)
				assert(game_scene)
				var game: Game = game_scene.instantiate().with_data(game_state)
				progress_bar.value = 1.0
				loading_complete.emit(game)
				set_process(false)

func start_loading(story_enum: StoryEnum.Enum) -> void:
	story_uid = StoryDB.get_story_uid(story_enum)
	var error: Error = ResourceLoader.load_threaded_request(story_uid)
	if error != OK:
		push_error("unable to load story %s" % story_uid)
		return
	
	progress_bar.value = 0.0
	loading_stage = LoadingStage.STORY
	set_process(true)
