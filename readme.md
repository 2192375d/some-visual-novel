## credits

## coding
In this project, I used `with_data()` for every class that needs to be instantiated with some extra data.
For example:
(some example)

### add new story
(completely independent from the game itself)
- create a new resource, set everything correspondingly
- modify the next story (set to NONE by default)
- add the story in the enum
- add the story in the mapping


## todo
- [ ] allow loading while playing some kinda animation
- [ ] add more stories (current at story_0_1)
- [ ] save load system (should be independent from the game entirely)
- [x] add text roll out

expected savefile content:
- time saved
- completed story enums
- current story enum


## problems in the future
- DialogueBlock does not keep track of character emotion, only an image for the character
