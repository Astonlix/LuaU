-- // Wait for game to load
if (not game:IsLoaded()) then 
	game.Loaded:Wait()
	task.wait(2)
end

repeat task.wait(0.2) until (game:GetService("Players").LocalPlayer) and (game:GetService("Players").LocalPlayer.Character)
game.Players.LocalPlayer:WaitForChild("DataFolder")
-- // Locals
local LocalPlayer = game.Players.LocalPlayer
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Backpack = LocalPlayer.Backpack
local Information = game:GetService("Players").LocalPlayer.DataFolder.Information
local UserInputService = game:GetService("UserInputService")
--// Settings
setfpscap(getgenv().Settings.FPS)
spawn(function()
    while task.wait() do
        if getgenv().Settings.CPU_Saver then
            UserInputService.WindowFocused:Connect(function()
                game:GetService("RunService"):Set3dRenderingEnabled(true)
            end)
            
            UserInputService.WindowFocusReleased:Connect(function()
                game:GetService("RunService"):Set3dRenderingEnabled(false)
            end)
        end
    end
end)
settings().Rendering.QualityLevel = getgenv().Settings.Quality_Level

UserSettings().GameSettings.MasterVolume = 0
-- // Check if script has been executed already
if _G.Loaded then
    warn("Autofarm is already loaded.")
    return
else
    _G.Loaded = true
end

--// Notifaction
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits", -- Required
	Text = "made by vurelix/astonlix on discord ^-^", -- Required
	Icon = "http://www.roblox.com/asset/?id=10198213112", -- Optional
    Duration = 999,
})
-- // Checks for MuscleInformation
if not Information:FindFirstChild("MuscleInformation") then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-84.605072, 22.5502319, -632.44989, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    task.wait(0.33)
    fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Lettuce] - $5"].ClickDetector)
    task.wait(0.5)
    if Backpack:FindFirstChild("[Lettuce]") then
        Player.Backpack["[Lettuce]"].Parent = Player.Character
        Character["[Lettuce]"]:Activate()
        task.wait(2)
    else
        return
    end
end


local Muscle = game:GetService("Players").LocalPlayer.DataFolder.Information.MuscleInformation

--// Check if skinny
task.spawn(function()
    while task.wait() do
        if Muscle.Value == "-15000" or Muscle.Value == "-15075" then
            game:GetService("Players").LocalPlayer:Kick("Script finished!")
        end
    end
end)
--// Main
if Muscle.Value ~= "-15000" then
    task.spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-84.605072, 22.5502319, -632.44989, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        while task.wait() do
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Lettuce] - $5"].ClickDetector)
            if Backpack:FindFirstChild("[Lettuce]") then
                Player.Backpack["[Lettuce]"].Parent = Player.Character
                Character["[Lettuce]"]:Activate()
            else
                task.wait(0.33)
                fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Lettuce] - $5"].ClickDetector)
            end 
        end
    end)
elseif Muscle.Value == "-15000" or Muscle.Value == "-15075" then
    game:GetService("Players").LocalPlayer:Kick("You are already skinny!")
    return
end
