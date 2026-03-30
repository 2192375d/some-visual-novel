# takes input story_enum, loads the data for that enum and pass it to game

extends Control

class_name LoadingScreen

@export var progress_bar: ProgressBar # expects range to be 0.0-1.0
var progress: Array[float] = [0.0]

var current_scene_enum: SceneEnum.Enum

signal loading_complete(node: Node)

func _ready() -> void:
	set_process(false)
	progress_bar.value = 0.0

func _process(_delta: float) -> void:
	assert(current_scene_enum)
	
	var target_path: StringName = SceneManager.scene_dictionary.get(current_scene_enum)
	var status: ResourceLoader.ThreadLoadStatus 
	status = ResourceLoader.load_threaded_get_status(target_path, progress)
	assert(status != ResourceLoader.THREAD_LOAD_INVALID_RESOURCE)
	
	if status == ResourceLoader.THREAD_LOAD_FAILED:
		printerr("unable to load scene")
		loading_complete.emit(null)
		set_process(false)
	elif status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		progress_bar.value = progress[0]
	elif status == ResourceLoader.THREAD_LOAD_LOADED:
		var target_scene: PackedScene = ResourceLoader.load_threaded_get(target_path)
		loading_complete.emit(target_scene.instantiate())
		set_process(false)

func start_loading(scene_enum: SceneEnum.Enum) -> void:
	current_scene_enum = scene_enum
	ResourceLoader.load_threaded_request(SceneManager.scene_dictionary.get(scene_enum))
	
	set_process(true)
#func load_game(story_enum: StoryEnum.Enum) -> void:
	#scene_enum = SceneEnum.Enum.GAME
	#var target_path: StringName = SceneManager.scene_dictionary.get(scene_enum)
	#ResourceLoader.load_threaded_request(target_path)
	#
	#
	#set_process(true)
