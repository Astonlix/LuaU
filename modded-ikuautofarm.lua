--[[
	This script was created by vurelix#0, and made possible by doomxx.	
]]--

-- [ Locals ] --

local UserInputService = game:GetService("UserInputService")

-- [ Settings ] --

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

if _G.Loaded then
    warn("Autofarm is already loaded.")
    return
else
    _G.Loaded = true
end

-- [ Optimizations ] --

loadstring(game:HttpGet("https://raw.githubusercontent.com/Astonlix/Roblox-Lua/Main/fps-booster"))()

-- [ Auto-Unjail ] --

local Shop = nil

for _,K in ipairs(workspace.Ignored.Shop:GetChildren()) do
    if K.Name:sub(1,5) == '[Key]' then
      Shop = K
    end
end

local Player = game.Players.LocalPlayer
local Backpack = Player.Backpack


Player.CharacterAdded:Connect(function(Character)

    local Cuff = Character:WaitForChild('BodyEffects').Cuff
    local Root = Character:WaitForChild('HumanoidRootPart')

    Cuff.Changed:Connect(function(playerIsJailed)

        if playerIsJailed == true then
            getgenv().Dis()
            warn("You're jailed, attempting to unjail..")           
            wait(3)

            repeat
            	if game.Players.LocalPlayer.Backpack:FindFirstChild('[Key]') then
            		warn('You already have a key!')
                    game.Players.LocalPlayer.Backpack['[Key]'].Parent = Character
            		return
            	end

                Root.CFrame = CFrame.new(Shop.Head.Position)
                wait(0.5)
                fireclickdetector(Shop.ClickDetector)
                wait(0.1)
            until
                game.Players.LocalPlayer.Backpack:FindFirstChild('[Key]')
                
            game.Players.LocalPlayer.Backpack['[Key]'].Parent = Character
            warn("You have been freed!")
            wait(3)
        else not playerIsJailed then
            getgenv().Enabled = true
        end
    end)
end)
-- [ Anchor Cash ] --

-- [ Main Script ] --

getgenv().Enabled = true
getgenv().Dis = function()
	Enabled = false

	for i,v in pairs(workspace:GetDescendants()) do 
		if (v:IsA("Seat")) or (v:IsA("VehicleSeat")) then 
			v.Disabled = true
		end
	end
end

if (not game:IsLoaded()) then 
	game.Loaded:Wait()
	task.wait(2)
end

repeat task.wait(0.2) until (game:GetService("Players").LocalPlayer) and (game:GetService("Players").LocalPlayer.Character)

local Players = game:GetService("Players")
local Cashiers = workspace.Cashiers
local Player = Players.LocalPlayer

loadstring(game:HttpGet("https://github.com/applless/RandomScripts/raw/main/AntiAfk"))()
pcall(function()local a=game:GetService("ReplicatedStorage").MainEvent;local b={"CHECKER_1","TeleportDetect","OneMoreTime"}local c;c=hookmetamethod(game,"__namecall",function(...)local d={...}local self=d[1]local e=getnamecallmethod()local f=getcallingscript()if e=="FireServer"and self==a and table.find(b,d[2])then return end return c(...)end)end)

for i,v in pairs(workspace:GetDescendants()) do 
	if (v:IsA("Seat")) or (v:IsA("VehicleSeat")) then 
		v.Disabled = true
	end
end

local GetClosestPart = function(Table)
	local ClosestPart = nil

	for i,v in pairs(Table) do
		if (ClosestPart == nil) then
			ClosestPart = v
		else
			if ((Player.Character.HumanoidRootPart.Position - v.Position).Magnitude) < ((ClosestPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude) then
				ClosestPart = v
			end
		end
	end
	
	return ClosestPart
end

local GetCashier = function()
	local AvailableCashiers = {}
	for i,v in pairs(Cashiers:GetChildren()) do 
		if (v:FindFirstChild("Humanoid")) and (v.Humanoid.Health > 0) then 
			AvailableCashiers[#AvailableCashiers+1] = v.Open
		end
	end
	
	local ClosestPart = GetClosestPart(AvailableCashiers)
	
	if (ClosestPart) and (ClosestPart.Parent) then 
		return ClosestPart.Parent
	else 
		return nil
	end

end

local GetCashParts = function()
	local CashParts = {}
	for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do 
		if (v.Name == "MoneyDrop") and ((Player.Character.HumanoidRootPart.Position - v.Position).Magnitude < 13) then 
			CashParts[#CashParts+1] = v
		end
	end
	
	return CashParts
end


task.spawn(function()
	while true and task.wait(0.33) do 
		if (Enabled == true) and (Player.Character) and (Player.Character:FindFirstChild("FULLY_LOADED_CHAR"))  then 
			local Cashier = nil
			repeat 
				Cashier = GetCashier()
				task.wait()
			until (Cashier ~= nil)

			
			repeat 
				if (Player.Backpack:FindFirstChild("Combat")) then 
					task.wait(0.77)
					pcall(function()
						Player.Backpack.Combat.Parent = Player.Character
					end)
					task.wait()
				end
				Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				Player.Character.HumanoidRootPart.CFrame = Cashier.Open.CFrame * CFrame.Angles(0, math.random(-180, 0), 0)
				
				if (Player.Character:FindFirstChild("Combat")) then 
					Player.Character.Combat:Activate()
					--Player.Character.Combat:Deactivate() Disabled because super punch is faster and more reliable on low fps.
				end

				
				task.wait()
			until (Cashier.Humanoid.Health <= 0) or (Enabled == false)
			
			repeat 
				local CashParts = GetCashParts()
				
				Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				Player.Character.HumanoidRootPart.CFrame = Cashier.Open.CFrame + Vector3.new(0, 2, 0)
				
				for i,v in pairs(CashParts) do 
					if (v:FindFirstChild("ClickDetector")) then 
						fireclickdetector(v.ClickDetector)
					end
				end

				task.wait()
			until (#CashParts <= 0) or (Enabled == false)

			repeat

				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.48085, 38.2480125, 200014.953, 0.507315397, 3.08652339e-08, -0.861760437, 1.37933904e-08, 1, 4.3936609e-08, 0.861760437, -3.41763169e-08, 0.507315397)
					
				task.wait()
			until (AvailableCashers <= 0) or (Enabled == false)
		end
	end
end)
