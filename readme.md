## codex
codex resume 019d06f1-4333-7350-ad01-51a57c2d6236

## credits
font: https://kmlgames.itch.io/friendly-scribbles/download/eyJpZCI6OTE3MzI3LCJleHBpcmVzIjoxNzY3NjgyNzM4fQ%3d%3d.LCGw0VV9RTgMK1HGKLWMXyQZ8lU%3d

## todo
- [ ] SL system (should be independent from the game entirely)
- [ ] add progress system
- [ ] allow loading while playing some kinda animation
- [ ] make a tooling script for adding new story
- [ ] optimize loading speed

### completed:
- [x] add text roll out
- [x] Recreate `Game`'s inputs:
	- `Story`
	- `StoryAsset` (Illlustrations + Soundtracks)
	- `StoryState` (index1, index2)
- [x] Modifications on `Game`:
	- make `DialogueBox`, `ChoiceBox` to be part of the `View` component of the game
	- add `History` component in the game
	- Block's execute function instead takes `View`, `History`, `StoryState` as input, where it updates view, add string in history, and modify story state after view signals back.
	- add History button (and the other buttons, once they are ready)
- [x] Modify the `SceneManager`; Recreate resource loading for each scene (only load images for the specific character/background on spot when loading the chapter), done through removing global asset state



expected savefile content:
- time saved
- completed story enums
- current story enum

## problems in the future
- DialogueBlock does not keep track of character emotion, only an image for the character
- The process of adding story is very tedious, involves multiple steps, consider refactoring the code so that it simply queries through `stories/stories/` directory, and updates the story database based of it

## coding

### enums
The enums used in game are stored as autoloads under `res://autoloads/enums/`
By far the enums are:
- `CharacterEnum`
- `SceneEnum`
- `StoryEnum`
Will be adding background enum next

### how add new story
(This process is tedious, but independent/modular enough so that it won't affect the rest of the game)
- create a new resource, set everything correspondingly, store it in `stories/stories/`
- modify the next story (set to NONE by default)
- add the story in the enum (`res://autoloads/enums/story_enum.gd`)
- add the story in the mapping (`res://autoloads/story_DB.gd`)

### RAM usage
expectation: RAM usage < 500mb

estimation:
- character images: 8 * 8 * 3mb = 192mb
- background images: 20 * 8mb = 160mb (only 3 max per story) -> 24mb
- soundtracks: 200mb (only 40 mb max per story) -> 40mb
- everything else: < 10mb
24 + 40 + 10 + 192 = 266mb

### general code overview
https://notability.com/app/note/c28edb1f-76da-4cdf-95f3-511c1fcdcc1f

### expected scenes
