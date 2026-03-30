extends Node

const BASE_SAVE_PATH: String = "user://save" # appended by later code, eg. user://save1.tres
const MAX_SAVE: int = 10

var save_datas: Array[SaveData]
var current_save_index: int



func _init() -> void:
	pass
