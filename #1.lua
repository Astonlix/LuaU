	_G.Console = true;
	_G.AutoTap = true;
	_G.AutoRebirth = true;
	_G.AutoEgg = true;
	local RemotePath = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices

	spawn(function()  
	    while _G.Console == true do
		print('Made by ', myName);
			wait()
	    end
	end)

	spawn(function()
	    while _G.AutoTap == true do
		RemotePath.BeastModeService.Begin:FireServer()
		local args = {
		    [1] = 1
		}
		RemotePath.ClickService.Click:FireServer(unpack(args))
		wait()
	    end
	end)

	spawn(function()
	    while _G.AutoRebirth == true do
		local args = {
		    [1] = 1
		}
		RemotePath.RebirthService.BuyRebirths:FireServer(unpack(args))
		wait(1)
	    end
	end)

	spawn(function()
	    while wait() do
		if not _G.AutoEgg then
		    break
		end
		RemotePath.EggService.Purchase:FireServer('basic')
		wait(1)
	    end
	end)
end
