local UIS = game:GetService("UserInputService")
local ScreenGUI = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
ScreenGUI.ResetOnSpawn = false
ScreenGUI.Name = "HDM"
local Frame = Instance.new("Frame",ScreenGUI)
Frame.Size = UDim2.new(0,298,0,407)
Frame.Position = UDim2.new(0.367,0,0.246,0)
Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
local UIGradient = Instance.new("UIGradient",Frame)
UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.407843, 0.407843, 0.407843)),ColorSequenceKeypoint.new(1,Color3.new(0.898039, 0.898039, 0.898039))})
UIGradient.Rotation = 45
local UICorner = Instance.new("UICorner",Frame)
UICorner.CornerRadius = UDim.new(0,15)
local UIDragDetector = Instance.new("UIDragDetector",Frame)
local SF1 = Instance.new("ScrollingFrame",Frame)
SF1.Size = UDim2.new(0,66,0,407)
SF1.Position = UDim2.new(0,0,0,0)
SF1.BackgroundTransparency = 1
SF1.ScrollBarThickness = 6
SF1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
SF1.BorderSizePixel = 0
SF1.Name = "SF1"
local UIListLayout = Instance.new("UIListLayout",SF1)
UIListLayout.Padding = UDim.new(0,5)
local UIPadding = Instance.new("UIPadding",SF1)
UIPadding.PaddingBottom = UDim.new(0,5)
UIPadding.PaddingLeft = UDim.new(0,5)
UIPadding.PaddingTop = UDim.new(0,5)
local SF2 = Instance.new("ScrollingFrame",Frame)
SF2.Size = UDim2.new(0,227,0,402)
SF2.Position = UDim2.new(0.238,0,0.012,0)
SF2.BackgroundTransparency = 1
SF2.ScrollBarThickness = 6
SF2.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
SF2.BorderSizePixel = 0
SF2.Name = "SF2"
local UIL = Instance.new("UIListLayout",SF2)
UIL.Padding = UDim.new(0,5)
UIL.FillDirection = Enum.FillDirection.Horizontal

local SF1E = {
	Main = {Color = Color3.new(0.882353, 0.882353, 0.882353)}
}
local SF2E = {
	Noclip = {Test = {Color = Color3.new(0.0980392, 0.219608, 1),Func = 'https://raw.githubusercontent.com/HeatDeaths/Heat-Death/refs/heads/main/NC'}, Test2 = {Color = Color3.new(0.807843, 0.541176, 1),Func = "game.Players.LocalPlayer.Character.WalkSpeed = 100"}},
}

for i, element in pairs(SF1E) do
	local TB = Instance.new("TextButton",SF1)
	TB.BackgroundColor3 = element.Color
	TB.TextScaled = true
	TB.BorderSizePixel = 0
	TB.Size = UDim2.new(0,50,0,50)
	TB.Text = i
	local UIC = Instance.new("UICorner",TB)
	UIC.CornerRadius = UDim.new(0,5)

	TB.MouseButton1Click:Connect(function()
		for ii,vv in pairs(SF2:GetChildren()) do
			if vv:IsA("TextButton") then vv:Destroy() continue end
		end		

		for iii,vvv in pairs(SF2E) do
			for iiii,vvvv in pairs(vvv) do
				local TB2 = Instance.new("TextButton",SF2)
				TB2.BackgroundColor3 = vvvv.Color
				TB2.TextScaled = true
				TB2.BorderSizePixel = 0
				TB2.Size = UDim2.new(0,50,0,50)
				TB2.Text = iiii
				local UIC2 = Instance.new("UICorner",TB2)
				UIC2.CornerRadius = UDim.new(0,5)
				
				TB2.MouseButton1Click:Connect(function()
					if vvvv.Func ~= nil then
						print(vvvv.Func)
						loadstring(game:HttpGet(vvvv.Func))()
					end
				end)
			end
		end
	end)
end

local open = true

UIS.InputBegan:Connect(function(input,gpe)
if gpe then return end

if input.KeyCode == Enum.KeyCode.P then
	if open then
	   ScreenGUI.Enabled = false
	   open = false
				
	else
	   ScreenGUI.Enabled = true
	   open = true
				
	end
	end
end)
