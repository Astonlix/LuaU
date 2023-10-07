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
	end
end

--// Main
task.spawn(function()
	while true and task.wait(0.2) do 
		if (Player.Character) and (Player.Character:FindFirstChild("FULLY_LOADED_CHAR")) and (Shutdown == false) then 
			local Root, Hum = Player.Character:WaitForChild("HumanoidRootPart"), Player.Character:WaitForChild("Humanoid")
			local Start = os.time()
			repeat 
				Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
				
				Cashier, Dist, Index = GetCashier() 
				task.wait()
			until (Cashier ~= nilor (Shutdown == true) 
			
			if (Unarresting == true) then 

				task.wait(0.5)
				repeat 
					local Key = workspace.Ignored.Shop["[Key] - $129"]

					Player.Character.HumanoidRootPart.CFrame = Key.Head.CFrame + Vector3.new(0, 1, 0)
					task.wait(0.5)

					fireclickdetector(Key.ClickDetector)

					if (Player.Backpack:FindFirstChild("[Key]")) then 
						pcall(function()
							Player.Backpack["[Key]"].Parent = Player.Character
						end)
					end
					task.wait()
				until (Shutdown == true) or (Unarresting == false)
			end
			
		

			repeat 
				Root.Velocity = Vector3.new(0, 0, 0)
				if (_G.AutofarmSettings.AttackMode == "4") then 
					if (Index == 15) or (Index == 16) then 
						Root.CFrame = Cashier.Head.CFrame + Cashier.Head.CFrame.LookVector * Vector3.new(-12, 2, -12) + Vector3.new(0, -2, 0)
					else 
						Root.CFrame = Cashier.Head.CFrame + Cashier.Head.CFrame.LookVector * Vector3.new(-4, 1, -4)  + Vector3.new(0, -2, 0)
					end
				else 
					Root.CFrame = Cashier.Head.CFrame + Cashier.Head.CFrame.LookVector * Vector3.new(-2.2, -1, -2.2) + Vector3.new(0, -2, 0)
				end
				
				task.wait(0.1)
				Attack()
			until (Cashier.Humanoid.Health <= 0) or (Shutdown == true)

			
			Root.CFrame = CFrame.new(Cashier.Head.Position) + Vector3.new(math.random(-2, 2), 1, math.random(-2, 2))
			
			EMPTY.Text = "| Picking Cash."

			if (Cashier.Humanoid.Health <= 0) then 
				BrokenATMs += 1
			end
			
			repeat 
				for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do 
					if (v.Name == "MoneyDrop") and (v:FindFirstChild("ClickDetector")) and (GetMag(v) < 17) then 
						fireclickdetector(v.ClickDetector)
						task.wait(0.1)
					end
				end
				task.wait(0.1)
			until (GetCloseCash() <= 0) or (Shutdown == true)
			
			Cashier = nil
		end
	end
end)
