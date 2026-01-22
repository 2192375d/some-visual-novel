extends PanelContainer

class_name SaveSlot
@export var index: int
@export_group("FIXED")
@export var date_label: Label
@export var subchapter_label: Label

signal slot_pressed(save_slot: SaveSlot)

func _on_button_pressed() -> void:
	slot_pressed.emit(self)

func update_content(save_data: SaveData):
	if save_data == null:
		date_label.text = "empty"
		subchapter_label.text = "empty"
		return
	
	date_label.text = Utils.unix_time_int_to_string(save_data.unix_time)
	subchapter_label.text = Utils.get_subchapter(save_data.subchapter_enum).title

func _ready() -> void:
	update_content(SaveManager.load_save(index))
