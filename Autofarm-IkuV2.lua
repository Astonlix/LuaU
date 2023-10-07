-- This script was made by vurelix, made possible by doomxx, and heavily/skidded inspired by czo. (applless)

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

for i = 1, 10 do 
	setfpscap(tonumber(_G.AutofarmSettings.Fps))
	task.wait(0.1)
end
