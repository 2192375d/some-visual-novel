## credits

## coding
In this project, I used `with_data()` for every class that needs to be instantiated with some extra data.
For example:
```gd
# expects the story_enum to load
func with_data(new_data) -> Node:
	data = new_data
	return self
```

Later on, from outside, you can just

```gd
var node_scene: PackedScene = ...
var node = node_scene.instantiate().with_data(data)
get_tree().change_scene_to_node(node)
```

## todo
- split enums to seperate files