--[[
Script made by:
Monochrome Studios - @neoflowkid
]]

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBox = Instance.new("TextBox")
local ToggleButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local Credits = Instance.new("TextLabel")
local Logo = Instance.new("ImageLabel")

ScreenGui.Name = "WalkSpeedGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Visible = true

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "WalkSpeed Controller"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

SpeedBox.Name = "SpeedBox"
SpeedBox.Parent = Frame
SpeedBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SpeedBox.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedBox.Size = UDim2.new(0.8, 0, 0, 30)
SpeedBox.Font = Enum.Font.SourceSans
SpeedBox.PlaceholderText = "Enter Speed"
SpeedBox.Text = ""
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.TextSize = 18

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleButton.Position = UDim2.new(0.1, 0, 0.6, 0)
ToggleButton.Size = UDim2.new(0.8, 0, 0, 30)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "Activate"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 18

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = Frame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MinimizeButton.Position = UDim2.new(0.9, -25, 0, 5)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18

Credits.Name = "Credits"
Credits.Parent = Frame
Credits.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Credits.Position = UDim2.new(0, 0, 0.85, 0)
Credits.Size = UDim2.new(1, 0, 0.1, 0)
Credits.Font = Enum.Font.SourceSansItalic
Credits.Text = "Credits: Monochrome Studios®"
Credits.TextColor3 = Color3.fromRGB(200, 200, 200)
Credits.TextSize = 14

Logo.Name = "Logo"
Logo.Parent = Frame
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0.35, 0, 0.75, 0)
Logo.Size = UDim2.new(0.3, 0, 0.1, 0)
Logo.Image = "https://www.roblox.com/asset/?id=83745594308180" 

local isActive = false
local originalSpeed = 16
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function setWalkSpeed(speed)
    humanoid.WalkSpeed = speed
end

local function toggleSpeed()
    if isActive then
        isActive = false
        setWalkSpeed(originalSpeed)
        ToggleButton.Text = "Activate"
    else
        local speed = tonumber(SpeedBox.Text)
        if speed and speed > 0 then
            isActive = true
            setWalkSpeed(speed)
            ToggleButton.Text = "Deactivate"
        else
            SpeedBox.Text = "Invalid Speed"
        end
    end
end

local function minimizeGUI()
    Frame.Visible = not Frame.Visible
end

ToggleButton.MouseButton1Click:Connect(toggleSpeed)
MinimizeButton.MouseButton1Click:Connect(minimizeGUI)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
end)
