extends Node

class_name Utils

#static func _enum_to_hint_string(enums: Dictionary) -> String:
	#return ",".join(enums.keys())
static func get_subchapter(subchapter_enum: Enums.SubchapterEnum) -> Subchapter:
	var path: String
	match subchapter_enum:
		Enums.SubchapterEnum.SCENE0_0:
			path = "res://resources/subchapter/subchapter0_0.res"
		Enums.SubchapterEnum.SCENE0_05:
			path = "res://resources/subchapter/subchapter0_05.res"
	
	var sub_chapter: Subchapter = load(path)
	return sub_chapter


static func unix_time_int_to_string(unix_time_int: int) -> String:
	var unix_time: Dictionary = Time.get_datetime_dict_from_unix_time(unix_time_int)
	return "%04d-%02d-%02d %02d:%02d" % [
		unix_time.year, 
		unix_time.month, 
		unix_time.day, 
		unix_time.hour, 
		unix_time.minute
	]
