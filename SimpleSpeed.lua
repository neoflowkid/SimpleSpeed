local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 300, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "WalkSpeed Settings"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.BackgroundTransparency = 1
title.Parent = frame

local walkSpeedInput = Instance.new("TextBox")
walkSpeedInput.Size = UDim2.new(0, 280, 0, 30)
walkSpeedInput.Position = UDim2.new(0, 10, 0, 60)
walkSpeedInput.PlaceholderText = "Enter WalkSpeed"
walkSpeedInput.TextSize = 18
walkSpeedInput.TextColor3 = Color3.fromRGB(0, 0, 0)
walkSpeedInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
walkSpeedInput.Parent = frame

-- Create the Set WalkSpeed button
local setWalkSpeedButton = Instance.new("TextButton")
setWalkSpeedButton.Size = UDim2.new(0, 280, 0, 50)
setWalkSpeedButton.Position = UDim2.new(0, 10, 0, 100)
setWalkSpeedButton.Text = "Set WalkSpeed"
setWalkSpeedButton.TextSize = 18
setWalkSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
setWalkSpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
setWalkSpeedButton.Parent = frame

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 50, 0, 50)
minimizeButton.Position = UDim2.new(1, -50, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextSize = 24
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
minimizeButton.Parent = frame

local function minimizeGui()
    frame.Size = UDim2.new(0, 300, 0, 50)  -- Only show the title
    walkSpeedInput.Visible = false
    setWalkSpeedButton.Visible = false
end

local function restoreGui()
    frame.Size = UDim2.new(0, 300, 0, 200)  -- Show full GUI
    walkSpeedInput.Visible = true
    setWalkSpeedButton.Visible = true
end

minimizeButton.MouseButton1Click:Connect(function()
    if frame.Size == UDim2.new(0, 300, 0, 50) then
        restoreGui()
    else
        minimizeGui()
    end
end)

local function setWalkSpeed()
    local speed = tonumber(walkSpeedInput.Text) or 16  
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
    end
end

-- Connect the WalkSpeed button to the function
setWalkSpeedButton.MouseButton1Click:Connect(setWalkSpeed)
