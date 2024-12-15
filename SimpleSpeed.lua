local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local SpeedBox = Instance.new("TextBox")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)

SpeedBox.Parent = Frame
SpeedBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SpeedBox.Size = UDim2.new(0.8, 0, 0.3, 0)
SpeedBox.Position = UDim2.new(0.1, 0, 0.1, 0)
SpeedBox.PlaceholderText = "Enter Speed"
SpeedBox.Text = ""
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)

ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleButton.Size = UDim2.new(0.8, 0, 0.3, 0)
ToggleButton.Position = UDim2.new(0.1, 0, 0.5, 0)
ToggleButton.Text = "Activate"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local isActive = false
local defaultSpeed = 16

ToggleButton.MouseButton1Click:Connect(function()
    local speed = tonumber(SpeedBox.Text)
    if speed and speed > 0 then
        if isActive then
            humanoid.WalkSpeed = defaultSpeed
            ToggleButton.Text = "Activate"
            isActive = false
        else
            humanoid.WalkSpeed = speed
            ToggleButton.Text = "Deactivate"
            isActive = true
        end
    else
        SpeedBox.Text = "Invalid Speed"
    end
end)
