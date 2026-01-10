extends Object

#enum Character { 
	#NAME0 = 0, 
	#NAME1 = 1, 
	#
	#UNKNOWN = 99 
#}
#
#func get_character_name(character: Character):
	#var result: StringName
	#
	#match character:
		#Character.NAME1:
			#result = &"YOU"
		#Character.NAME1:
			#result = &"𪚥𪙔"
		#Character.UNKNOWN:
			#result = &"???"
	#
	#return result
