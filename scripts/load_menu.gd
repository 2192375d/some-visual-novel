extends CanvasLayer

@export_group("FIXED")
@export var back_to_main_menu_button: Button
@export var blur_rectangle: ColorRect
@export var grid_container: GridContainer
@export var check_button: CheckButton

@onready var load_mod: bool = false

func _ready() -> void:
	if !Cache.game_playing:
		back_to_main_menu_button.disabled = true
		load_mod = true
		check_button.button_pressed = true
		check_button.disabled = true
	
	blur_rectangle.show()
	
	for save_slot: SaveSlot in grid_container.get_children():
		save_slot.slot_pressed.connect(_on_save_slot_pressed)

func _on_go_back_pressed() -> void:
	queue_free()

func _on_back_to_main_menu_pressed() -> void:
	SceneFlow.run_main_menu_scene()

func _on_save_slot_pressed(save_slot: SaveSlot) -> void:
	if load_mod:
		var save_data: SaveData = SaveManager.load_save(save_slot.index)
		if save_data == null:
			# to be handled later
			return
		
		Cache.set_subchapter_enum_to_load(save_data.subchapter_enum)
		Cache.set_block_index(save_data.block_index)
		SceneFlow.run_loading_screen_scene()
	else:
		if !Cache.game_playing:
			return
		
		var save_data: SaveData = SaveData.new()
		save_data.block_index = Cache.get_block_index()
		save_data.subchapter_enum = Cache.get_subchapter_enum_to_load()
		save_data.unix_time = int(Time.get_unix_time_from_system())
		
		SaveManager.save(save_slot.index, save_data)
		save_slot.update_content(save_data)

func _on_check_button_toggled(toggled_on: bool) -> void:
	load_mod = toggled_on
