-- This script was made by vurelix, made possible by doomxx, and heavily inspired by czo. (applless)

if (_G.EXC ~= nil) then
	warn("This script is already executed!")
	return 
else 
	_G.EXC = "@vurelix, @doomxx, @trans"
end

if (not game:IsLoaded()) then 
	game.Loaded:Wait()
	task.wait(1)
end

repeat task.wait(0.1) until (game:GetService("Players").LocalPlayer) and (game:GetService("Players").LocalPlayer.Character)
