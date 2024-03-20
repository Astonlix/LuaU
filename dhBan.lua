local plr = game.Players.LocalPlayer
local char = plr.Character
local root = char:WaitForChild('HumanoidRootPart')

local BG = Instance.new('BodyGyro', root)
local BV = Instance.new('BodyVelocity', root)
BG.P = 9e4
BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
BG.cframe = root.CFrame
BV.velocity = Vector3.new(0, 0, 0)
BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
