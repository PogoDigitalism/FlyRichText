local FlyRichText = {}

--["Tutorial"] = {
--	stroke = {
--		color = Color3.fromRGB(255, 170, 0),
--		thickness = 2
--	} 
--},

export type property = "text_color" | "stroke" | "style"
export type stroke = {
	color: Color3,
	thickness: number
}
export type text_color = {
	color: Color3
}
export type style = {
	style: "italic" | "bold"
}


export type Rich = {
	[string]: {
		[property]: stroke | text_color | style
	}
}

local style_convertion = {
	italic = "i",
	bold = "b",
	underline = "u",
}

local wrapping_funcs = {
	stroke = function(text, stroke: stroke)
		return string.format('<stroke color="rgb(%d, %d, %d)" thickness="%d">%s</stroke>', 
			stroke.color.R*255, 
			stroke.color.G*255, 
			stroke.color.B*255, 
			stroke.thickness, 
			text)
	end,
	
	text_color = function(text, text_color: text_color)
		return string.format('<font color="rgb(%d, %d, %d)">%s</font>', 
			text_color.color.R*255, 
			text_color.color.G*255, 
			text_color.color.B*255, 
			text)
	end,

	style = function(text, style: style)
		local converted = style_convertion[style.style]
		return string.format(`<{converted}>%s</{converted}>`, 
			text)
	end
}

function FlyRichText.ApplyRichText(rich_applications: Rich, to_rich: string)
	for keyword, formatting in pairs(rich_applications) do
		for property_name, property_info in formatting do
			if to_rich:find(keyword) then
				to_rich = to_rich:gsub(keyword, wrapping_funcs[property_name](keyword, property_info))
			end
		end
	end

	return to_rich
end

return FlyRichText
