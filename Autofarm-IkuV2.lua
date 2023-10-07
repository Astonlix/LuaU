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

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Cashiers = workspace.Cashiers
local Player = Players.LocalPlayer


if (_G.AutofarmSettings.Credits ~= "iku autofarm - by @trans") then 
	Player:Kick("Don't try to change the credits.")
	task.wait(10)
	Cashiers:Destroy()
end


repeat task.wait() until (Player.Character:FindFirstChild("FULLY_LOADED_CHAR"))
pcall(function()local a=game:GetService("ReplicatedStorage").MainEvent;local b={"CHECKER_1","TeleportDetect","OneMoreTime"}local c;c=hookmetamethod(game,"__namecall",function(...)local d={...}local self=d[1]local e=getnamecallmethod()local f=getcallingscript()if e=="FireServer"and self==a and table.find(b,d[2])then return end return c(...)end)end)
task.wait(1)

Player.Idled:Connect(function()
	for i = 1, 10 do 
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame) 
		task.wait(0.2) 
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		task.wait(0.2)
	end
end)


for i = 1, 10 do 
	setfpscap(tonumber(_G.AutofarmSettings.Fps))
	task.wait(0.1)
end

game:GetService("RunService"):Set3dRenderingEnabled(false)
pcall(function() UserSettings().GameSettings.MasterVolume = 0 end)
pcall(function() settings().Rendering.QualityLevel = "Level01" end)

task.spawn(function()
	for i,v in pairs(workspace:GetDescendants()) do 
		if (v:IsA("Seat") or (v:IsA("VehicleSeat"))) then 
			v:Destroy()
		end
	end
end)

local GetCashier = function()
	local Cashier, Index = nil, 0
	for i,v in pairs(Cashiers:GetChildren()) do 
		if (v.Humanoid.Health > 0) then 
			if (Cashier == nil) then 
				Cashier = v 
			else 
				if (GetMag(v.Head) < GetMag(Cashier.Head)) then 
					Cashier = v
					Index = i
				end
			end
		end
	end

	if (Cashier ~= nil) then 
		return Cashier, GetMag(Cashier.Head), Index
	else 
		return nil
	end

end


local GetCloseCash = function()
	local Am = 0
	
	for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do 
		if (v.Name == "MoneyDrop") and (v:FindFirstChild("ClickDetector")) and (GetMag(v) < 17) then 
			Am += 1
		end
	end
	return Am
end

local Attack = function()
	if (Player.Backpack:FindFirstChild("Combat")) then 
		task.wait(1.5)
		pcall(function()
			Player.Backpack.Combat.Parent = Player.Character
		end)
	end
		local Combat = Player.Character:FindFirstChild("Combat")
		if (Combat == nil) end

		Combat:Activate()

		if (Mode == 1) then 
			task.wait()
			Combat:Deactivate()
		end
	elseif (Mode == 3) then
		if (Player.DataFolder.Currency.Value < 200) then 
			task.spawn(function()
				EMPTY.Text = "| Not enough dhc."
				task.wait(10)
				EMPTY.Text = "|"
			end)
			return Log("nigga how are you that broke that you cant afford to buy a knife lol.")
		end

		if (Player.Backpack:FindFirstChild("[Knife]") == nil) and (Player.Character:FindFirstChild("[Knife]") == nil) then 
			Log("buying knife.")
			
			EMPTY.Text = "| Buying knife."

			repeat 
				local KnifeBuy = workspace.Ignored.Shop["[Knife] - $155"]
				Player.Character.HumanoidRootPart.CFrame = KnifeBuy.Head.CFrame + Vector3.new(0, 3.2, 0)
				task.wait(0.2)
				fireclickdetector(KnifeBuy.ClickDetector)
			until (Player.Backpack:FindFirstChild("[Knife]")) or (Player.Character:FindFirstChild("[Knife]")) or (Shutdown == true)
			EMPTY.Text = "|"
		end

		if (Player.Backpack:FindFirstChild("[Knife]")) then 
			task.wait(0.66)
			pcall(function()
				Player.Backpack["[Knife]"].Parent = Player.Character
			end)
		end

		local Knife = Player.Character:FindFirstChild("[Knife]")
		if (Knife == nil) then return Log("no knife tool found.") end

		Knife:Activate()
		task.wait(0.1)
	end
end
