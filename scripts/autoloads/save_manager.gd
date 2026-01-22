extends Node

const SAVE_SLOT_COUNT: int = 12
const SAVE_DIR_PATH: String = "user://saves"

func index_to_path(slot_index: int) -> String:
	return SAVE_DIR_PATH + "/save_%03d.tres" % [slot_index]

func save(slot_index: int, data: SaveData) -> void:
	if slot_index < 0 or slot_index > SAVE_SLOT_COUNT:
		push_error("invalid save slot")
		return
	DirAccess.make_dir_recursive_absolute(SAVE_DIR_PATH)
	
	ResourceSaver.save(data, index_to_path(slot_index))

func load_save(slot_index: int) -> SaveData:
	if slot_index < 0 or slot_index > SAVE_SLOT_COUNT:
		push_error("invalid save slot")
		return null
	
	var save_path: String = index_to_path(slot_index)
	if !FileAccess.file_exists(save_path):
		return null
	
	var save_data: SaveData = ResourceLoader.load(save_path)
	
	return save_data
