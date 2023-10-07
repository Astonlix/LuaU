local Player = game.Players.LocalPlayer
function loadScript()
	Player:Kick("Waiting for response..");
	task.wait(5)
	Player:Kick("Duped sucessfully!");
end

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
function Whitelist()
	game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Whitelist System", Text = "Authorizing..", }); task.wait(3);  print("Your ScriptKey is: ".. getgenv().ScriptKey); print("Your HWID is: " .. HWID); task.wait(3); print(getgenv().Settings.DupeMethod); game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Whitelist System", Text = "Sucessfully Authorized!", }); loadScript()
end

Whitelist()
