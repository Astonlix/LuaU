if (not game:IsLoaded()) then 
	game.Loaded:Wait()
	task.wait(2)
end

repeat task.wait(0.2) until (game:GetService("Players").LocalPlayer) and (game:GetService("Players").LocalPlayer.Character)

spawn(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(515.544861, 31.5, -92.5845947, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	task.wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(572.099976, 409.5, -117.799988, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	task.wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(659.599976, 817, -8.79998779, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	task.wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(429.099976, 1219.5, 17.2000122, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	task.wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(486.599976, 1607.5, 60.7000122, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)
