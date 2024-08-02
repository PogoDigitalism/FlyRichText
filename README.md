# FlyRichText
Easy-to-apply chat to rich text formatting in Roblox

Example:
```lua
dialogue_part = {
	quest_step = false,
	style = "box",
	
	chat =  "Hi there! Welcome to this game! I am Suit Man, and I will guide you through the tutorial!",
	rich = {
		["game"] = {
			stroke = {
				color = Color3.fromRGB(255, 170, 0),
				thickness = 2
			} 
		},
		["Suit Man"] = {
			stroke = {
				color = Color3.fromRGB(255, 53, 53),
				thickness = 2
			} 
		}
	},

main_frame.ChatLabel.Text = FlyRichText.ApplyRichText(dialogue_part.rich, dialogue_part.chat)
```
