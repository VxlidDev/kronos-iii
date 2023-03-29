local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/VxlidDev/kronos-iii/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
	Name = "Kronos - III Exploit Panel",
	LoadingTitle = "Kronos - III Exploit Loader",
	LoadingSubtitle = "by VxlidDev",
	ConfigurationSaving = {
		Enabled = false
	},
	KeySystem = true, -- Set this to true to use their key system
	KeySettings = {
		Title = "Kronos Hub",
		Subtitle = "Key System",
		Note = "Ask Vxl",
		SaveKey = true,
		Key = "*e^s40C5z"
	}
})

local Tab = Window:CreateTab("Scripting", 6022668888) -- Title, Image

Tab:CreateSection("Pre-Made", true)
Tab:CreateButton({
	Name = "Load IY",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end,
})
Tab:CreateButton({
	Name = "Load Dex",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
	end,
})
Tab:CreateButton({
	Name = "Load SimpleSpy",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
	end,
})

Tab:CreateSection("Custom Made", true);
Tab:CreateButton({
	Name = "Get all CD Shop Items (Costs Credits)",
	Callback = function(Value)
		local remote = game:GetService("ReplicatedStorage"):WaitForChild("CDShop");
		local wait_time = 0.2

		local function call(b)
			if b then task.wait(11) end
			remote:FireServer("L4Access")
			task.wait(wait_time)
			remote:FireServer("M4A1")
			task.wait(wait_time)
			remote:FireServer("HealGun")
			task.wait(wait_time)
			remote:FireServer("G18") 
		end

		call(false);
	end
})

Tab:CreateButton({
	Name = "Team To Hostile (M4, Medibag, HealGun)",
	Callback = function(Value)
		if game.Players.LocalPlayer.Team.Name ~= "D Class Personnel" then
			return Rayfield:Notify({
				Title = "not on cd team",
				Content = "your nigger ass isnt on the class d team",
				Duration = 3,
				Image = 7072725208
			});
		end

		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

		-- character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-20.718, 316.45, 238.814)

		local part = nil;

		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Part" and v.Size == Vector3.new(6.4, 1.6, 5.8) then
				part = v;
				break;
			end
		end

		if part then
			local partorgcframe = part.CFrame;
			part.CFrame = character:WaitForChild("HumanoidRootPart").CFrame;
			task.wait(1);
			part.CFrame = partorgcframe;
		else
			local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

			character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-20.718, 316.45, 238.814)
		end
	end
})

Tab:CreateDropdown({
	Name = "CD Shop",
	Options = {"Riot", "Glock", "Heal Gun", "L4 Access", "M4A1"},
	CurrentOption = "Riot",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		local options = {
			["L4 Access"] = "L4Access",
			["M4A1"] = "M4A1",
			["Heal Gun"] = "HealGun",
			["Glock"] = "G18",
			["Riot"] = "Riot"
		}

		local option = options[Option];

		local remote = game:GetService("ReplicatedStorage"):WaitForChild("CDShop");
		remote:FireServer(option);
	end,
})

Tab:CreateToggle({
	Name = "Make 966 Visible",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		-- The function that takes place when the toggle is pressed
		-- The variable (Value) is a boolean on whether the toggle is true or false
		for i,v in pairs(workspace['SCP-966']:GetDescendants()) do
			if not (v:IsA("BasePart")) then
				if (v:IsA("MeshPart")) then
					if (v.Name ~= "HumanoidRootPart") then
						v.Transparency = Value == true and 0 or 1
					end
				end

			elseif (v.Name ~= "HumanoidRootPart") then
				v.Transparency = Value == true and 0 or 1
			end
		end
	end,
});

local TeleportTab = Window:CreateTab("Teleports", 6034503375)

TeleportTab:CreateLabel("This section is extremely noticeable! Proceed with high caution.")
TeleportTab:CreateSection("Intel Teleports", true)

TeleportTab:CreateButton({
	Name = "CDCZ VA",
	Callback = function()
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

		local TPLocations = game.Workspace:FindFirstChild("TPLocations");
		if TPLocations then
			local VA = TPLocations:FindFirstChild("VA");
			if VA then
				character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
			end
		end
	end
})
TeleportTab:CreateButton({
	Name = "S-1",
	Callback = function()
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

		local TPLocations = game.Workspace:FindFirstChild("TPLocations");
		if TPLocations then
			local VA = TPLocations:FindFirstChild("Sector-1");
			if VA then
				character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
			end
		end
	end
})
TeleportTab:CreateButton({
	Name = "S-2",
	Callback = function()
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

		local TPLocations = game.Workspace:FindFirstChild("TPLocations");
		if TPLocations then
			local VA = TPLocations:FindFirstChild("Sector-2");
			if VA then
				character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
			end
		end
	end
})
TeleportTab:CreateButton({
	Name = "S-3",
	Callback = function()
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

		local TPLocations = game.Workspace:FindFirstChild("TPLocations");
		if TPLocations then
			local VA = TPLocations:FindFirstChild("Sector-3");
			if VA then
				character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
			end
		end
	end
})
TeleportTab:CreateButton({
	Name = "Control Room",
	Callback = function()
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

		local TPLocations = game.Workspace:FindFirstChild("TPLocations");
		if TPLocations then
			local VA = TPLocations:FindFirstChild("CR");
			if VA then
				character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
			end
		end
	end
})
TeleportTab:CreateButton({
	Name = "Breach Shelter",
	Callback = function()
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

		local TPLocations = game.Workspace:FindFirstChild("TPLocations");
		if TPLocations then
			local VA = TPLocations:FindFirstChild("BS");
			if VA then
				character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
			end
		end
	end
})

TeleportTab:CreateSection("Other Teleports", true)
TeleportTab:CreateDropdown({
	Name = "S-1 Spawns",
	Options = {
		"Pick One",
		"Engineering",
		"Foundation Personnel",
		"Scientific",
		"Medical",
		"DEA",
		"EC",
		"GOC",
		"MaD",
		"Security Corps"
	},
	CurrentOption = "Pick One",
	Flag = "Dropdown2",
	Callback = function(Option)
		if Option ~= "Pick One" then
			local Teleports = {
				["Engineering"] = CFrame.new(-595.514, 357.652, 197.183),
				["Foundation Personnel"] = CFrame.new(-737.426, 357.392, 12.059),
				["Scientific"] = CFrame.new(-660.361, 341.365, -214.844),
				["Medical"] = CFrame.new(-822.846, 342.384, 104.056),
				["DEA"] = CFrame.new(-625.829, 342.347, -24.722),
				["EC"] = CFrame.new(-569.746, 341.135, -74.272),
				["GOC"] = CFrame.new(-926.75, 289.5, 74.248),
				["MaD"] = CFrame.new(-942.186, 418.097, -58.186),
				["Security Corps"] = CFrame.new(-514.731, 340.479, -76.457)
			}

			local pos = Teleports[Option];

			if pos then
				local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

				character:WaitForChild("HumanoidRootPart").CFrame = pos
			end
		end
	end
})

TeleportTab:CreateDropdown({
	Name = "S-2 SCPs",
	Options = {
		"Pick One",
		"SCP-500 (U)",
		"SCP-409 (U)",
		"SCP-999 (S)",
		"SCP-035 (K)",
		"SCP-008 (K)",
		"SCP-472 (E)",
		"SCP-049 (E)",
		"SCP-173 (E)"
	},
	CurrentOption = "Pick One",
	Flag = "Dropdown3",
	Callback = function(Option)
		if Option ~= "Pick One" then
			local Teleports = {
				["SCP-500 (U)"] = CFrame.new(-404.972, 330.67, 72.251),
				["SCP-409 (U)"] = CFrame.new(-344.51, 332.532, 85.089),
				["SCP-999 (S)"] = CFrame.new(-496.169, 330.804, 181.975),
				["SCP-035 (K)"] = CFrame.new(-436.388, 330.523, 170.949),
				["SCP-008 (K)"] = CFrame.new(-481.858, 331.763, 136.405),
				["SCP-472 (E)"] = CFrame.new(-363.915, 331.392, 170.716),
				["SCP-049 (E)"] = CFrame.new(-221.254, 321.469, 223.861),
				["SCP-173 (E)"] = CFrame.new(-309.985, 321.057, 249.858),
			}

			local pos = Teleports[Option];

			if pos then
				local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

				character:WaitForChild("HumanoidRootPart").CFrame = pos
			end
		end
	end
})

local CameraTab = Window:CreateTab("Camera", 6031770997);

local People = {
	game.Players.LocalPlayer.Name
}

for i,v in pairs(game.Players:GetPlayers()) do
	if v.Name ~= game.Players.LocalPlayer.Name then
		People[#People + 1] = v.Name;
	end
end

local CurrentlyViewing = nil;

local ViewDropdown = CameraTab:CreateDropdown({
	Name = "View",
	Options = People,
	CurrentOption = game.Players.LocalPlayer.Name,
	Flag = "Dropdown2",
	Callback = function(option)
		local playerToView = game.Players:FindFirstChild(option);

		if playerToView then
			local character = playerToView.Character or playerToView.CharacterAdded:Wait();

			if character then
				if option == game.Players.LocalPlayer.Name then CurrentlyViewing = nil; else CurrentlyViewing = game.Players[option].Name end
				
				game.Workspace.CurrentCamera.CameraSubject = character.Humanoid;
			end
		end
	end,
})

Tab:CreateButton({
	Name = "Destroy UI",
	Callback = function()
		Rayfield:Destroy()
	end,
})

game.Players.PlayerAdded:Connect(function(p)
	People[#People + 1] = p.Name;

	ViewDropdown:Refresh(People, CurrentlyViewing or game.Players.LocalPlayer.Name);
end);

game.Players.PlayerRemoving:Connect(function(p)
	if CurrentlyViewing == p.Name then
		CurrentlyViewing = nil;
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
		
		Rayfield:Notify({
			Title = "Stopped Viewing",
			Content = "The person you were viewing left the game.",
			Duration = 5,
			Image = 6031763426,
			Actions = {
				Ignore = {
					Name = "Ok!"
				}
			}
		});
	end
	
	for i,v in pairs(People) do
		if v == p.Name then
			table.remove(People, i);
		end
	end
	
	ViewDropdown:Refresh(People, CurrentlyViewing or game.Players.LocalPlayer.Name)
end)


-- Extras

-- getgenv().SecureMode = true -- Only Set To True If Games Are Detecting/Crashing The UI

-- Rayfield:Destroy() -- Destroys UI

-- Rayfield:LoadConfiguration() -- Enables Configuration Saving

-- Section:Set("Section Example") -- Use To Update Section Text

-- Button:Set("Button Example") -- Use To Update Button Text

-- Toggle:Set(false) -- Use To Update Toggle

-- Slider:Set(10) -- Use To Update Slider Value

-- Label:Set("Label Example") -- Use To Update Label Text

-- Paragraph:Set({Title = "Paragraph Example", Content = "Paragraph Example"}) -- Use To Update Paragraph Text

-- Keybind:Set("RightCtrl") -- Keybind (string) -- Use To Update Keybind

-- Dropdown:Set("Option 2") -- The new option value -- Use To Update/Set New Dropdowns
