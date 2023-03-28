-- VxlidDev
-- lmao

local Toggled966 = false;
local ToggledESP = false;

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

COREGUI = game:GetService("CoreGui")
Players = game:GetService("Players")

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function ESP(plr)
	task.spawn(function()
		for i,v in pairs(COREGUI:GetChildren()) do
			if v.Name == plr.Name..'_ESP' then
				v:Destroy()
			end
		end
		wait()
		if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not COREGUI:FindFirstChild(plr.Name..'_ESP') then
			local ESPholder = Instance.new("Folder")
			ESPholder.Name = plr.Name..'_ESP'
			ESPholder.Parent = COREGUI
			repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
			for b,n in pairs (plr.Character:GetChildren()) do
				if (n:IsA("BasePart")) then
					local a = Instance.new("BoxHandleAdornment")
					a.Name = plr.Name
					a.Parent = ESPholder
					a.Adornee = n
					a.AlwaysOnTop = true
					a.ZIndex = 10
					a.Size = n.Size
					a.Transparency = 0.5
					a.Color = plr.TeamColor
				end
			end
			if plr.Character and plr.Character:FindFirstChild('Head') then
				local BillboardGui = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = plr.Character.Head
				BillboardGui.Name = plr.Name
				BillboardGui.Parent = ESPholder
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 20
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = 'Name: '..plr.Name
				TextLabel.ZIndex = 10
				local espLoopFunc
				local teamChange
				local addedFunc
				addedFunc = plr.CharacterAdded:Connect(function()
					if ToggledESP then
						espLoopFunc:Disconnect()
						teamChange:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						ESP(plr)
						addedFunc:Disconnect()
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
					end
				end)
				teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
					if ToggledESP then
						espLoopFunc:Disconnect()
						addedFunc:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
						ESP(plr)
						teamChange:Disconnect()
					else
						teamChange:Disconnect()
					end
				end)
				local function espLoop()
					if COREGUI:FindFirstChild(plr.Name..'_ESP') then
						if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
							local pos = math.floor((getRoot(Players.LocalPlayer.Character).Position - getRoot(plr.Character).Position).magnitude)
							TextLabel.Text = 'Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
						end
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
						espLoopFunc:Disconnect()
					end
				end
				espLoopFunc = game:GetService("RunService").RenderStepped:Connect(espLoop)
			end
		end
	end)
end

-- INITIALIZE
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local colors = {
	SchemeColor = Color3.fromRGB(149, 149, 149),
	Background = Color3.fromRGB(71, 71, 71);
	Header = Color3.fromRGB(93, 93, 93),
	TextColor = Color3.fromRGB(255,255,255),
	ElementColor = Color3.fromRGB(93,93,93)
}

local Window = Library.CreateLib("Kronos - III | By VxlidDev", "BloodTheme");

local HitboxValue = 5;

-- Functions
local FunctionsTab = Window:NewTab("Functions")
local BISection = FunctionsTab:NewSection("Built-In")

BISection:NewButton("Load Infinite Yield", "Loads Infinite Yield for you.", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))();
end);

BISection:NewButton("Load DEX Explorer", "Loads the explorer window, allowing you to see all files in game.", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))();
end);

BISection:NewButton("Load Remote Spy", "Loads a new RSpy Window so you can see all remotes being fired.", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))();
end);

local CMSection = FunctionsTab:NewSection("Custom Made")

CMSection:NewButton("Buy all CD Items", "Must be on CD team, and it will still cost credits.", function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage");
	local CDShop_Remote = ReplicatedStorage:WaitForChild("CDShop");
	local Wait_Time = 0.2;

	local function getCDItems()
		CDShop_Remote:FireServer("L4Access"); -- buys L4 Access
		task.wait(Wait_Time);
		CDShop_Remote:FireServer("M4A1"); -- buys M4A1
		task.wait(Wait_Time);
		CDShop_Remote:FireServer("HealGun"); -- buys Heal Gun
		task.wait(Wait_Time);
		CDShop_Remote:FireServer("G18"); -- buys G18
	end

	getCDItems();
end);

CMSection:NewToggle("Make 966 Visible", "Makes SCP-966 Visible for you to see them, as it's invisible in vanilla.", function(state)
	Toggled966 = state
end);

-- Teleports
local TeleportsTab = Window:NewTab("Teleports");
local SiteSection = TeleportsTab:NewSection("Site")

SiteSection:NewButton("CDCZ VA", "Teleports you to the Viewing Area.", function()
	local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

	local TPLocations = game.Workspace:FindFirstChild("TPLocations");
	if TPLocations then
		local VA = TPLocations:FindFirstChild("VA");
		if VA then
			character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
		end
	end
end);

SiteSection:NewButton("S-1", "Teleports you to S-1.", function()
	local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

	local TPLocations = game.Workspace:FindFirstChild("TPLocations");
	if TPLocations then
		local VA = TPLocations:FindFirstChild("Sector-1");
		if VA then
			character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
		end
	end
end);

SiteSection:NewButton("S-2", "Teleports you to S-2.", function()
	local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

	local TPLocations = game.Workspace:FindFirstChild("TPLocations");
	if TPLocations then
		local VA = TPLocations:FindFirstChild("Sector-2");
		if VA then
			character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
		end
	end
end);

SiteSection:NewButton("S-3", "Teleports you to S-3.", function()
	local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

	local TPLocations = game.Workspace:FindFirstChild("TPLocations");
	if TPLocations then
		local VA = TPLocations:FindFirstChild("Sector-3");
		if VA then
			character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
		end
	end
end);

SiteSection:NewButton("Control Room", "Teleports you to the site control room.", function()
	local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

	local TPLocations = game.Workspace:FindFirstChild("TPLocations");
	if TPLocations then
		local VA = TPLocations:FindFirstChild("CR");
		if VA then
			character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
		end
	end
end);

SiteSection:NewButton("Breach Shelter", "Teleports you to the site breach shelter.", function()
	local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait();

	local TPLocations = game.Workspace:FindFirstChild("TPLocations");
	if TPLocations then
		local VA = TPLocations:FindFirstChild("BS");
		if VA then
			character:WaitForChild("HumanoidRootPart").CFrame = VA.CFrame;
		end
	end
end);

SiteSection:NewDropdown("SCPs", "Teleports you to SCPs", {}, function(currentOption)
	print(currentOption)
end);

-- ESP
local OtherTab = Window:NewTab("Other");
local OtherSection = OtherTab:NewSection("Other");

OtherSection:NewToggle("Toggle ESP", "Toggles ESP on/off.", function(state)
	if state then
		ToggledESP = true;
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.ClassName == "Player" and v.Name ~= game.Players.LocalPlayer.Name then
				ESP(v);
			end
		end
	else
		ToggledESP = false;
		for i,c in pairs(COREGUI:GetChildren()) do
			if string.sub(c.Name, -4) == '_ESP' then
				c:Destroy();
			end
		end
	end
end);

OtherSection:NewSlider("Hitbox Size", "Change the size of the hitbox.", 20, 1, function(s)
	HitboxValue = s;
end);

local function getCombativePlayers()
	local plrs = {};
	local CombativeTeams = {
		"Security Corps",
		"Special Operations",
		"Mobile Task Force",
		"DOCIAS",
		"Global Occult Coalition"
	}
	for i,v in pairs(game.Players:GetPlayers()) do
		print('A')
		local teamName = v.Team.Name
		print(teamName)
		if teamName == "Security Corps" or teamName == "Special Operations" or teamName == "Mobile Task Force" or teamName == "DOCIAS" or teamName == "Global Occult Coalition" then
			print('Yes.')
			if v.Name ~= game.Players.LocalPlayer.Name then plrs[#plrs + 1] = v.Name end
		end
	end

	return plrs
end

OtherSection:NewButton("Set Hitbox of Combatants", "Sets the hitbox of the combatives to the size you have set.", function()
	local size = HitboxValue;

	local players = getCombativePlayers();

	
	for i,v in pairs(players) do
		print(v);
		if Players[v].Character:FindFirstChild('Head') then
			local Size = Vector3.new(size,size,size);
			local Root = Players[v].Character:FindFirstChild('HumanoidRootPart');
			if Root:IsA("BasePart") then
				Root.Size = Size
				if ToggledESP then -- updates esp to show new hitbox, if esp is enabled
					for i,v in pairs(game.Players:GetPlayers()) do
						if v.ClassName == "Player" and v.Name ~= game.Players.LocalPlayer.Name then
							ESP(v);
						end
					end
				end
			end
		end
	end
end);

local SettingsTab = Window:NewTab("Settings");
local SettingsSection = SettingsTab:NewSection("Settings");

SettingsSection:NewKeybind("Toggle Keybind", "Set the toggle keybind.", Enum.KeyCode.N, function()
	Library:ToggleUI()
end);

-- Toggle Handler
game:GetService("RunService").RenderStepped:Connect(function()
	if Toggled966 == true then
		if workspace:FindFirstChild("SCP-966") then
			local SCP966 = workspace:FindFirstChild("SCP-966");
			for _, value in next, SCP966:GetDescendants() do
				if not value:IsA("BasePart") then
					if value:IsA("MeshPart") then
						if value.Name ~= "HumanoidRootPart" then
							value.Transparency = 0;
						end
					end
				elseif value.Name ~= "HumanoidRootPart" then
					value.Transparency = 0;
				end
			end
		end
	else
		if workspace:FindFirstChild("SCP-966") then
			local SCP966 = workspace:FindFirstChild("SCP-966");
			for _, value in next, SCP966:GetDescendants() do
				if not value:IsA("BasePart") then
					if value:IsA("MeshPart") then
						if value.Name ~= "HumanoidRootPart" then
							value.Transparency = 1;
						end
					end
				elseif value.Name ~= "HumanoidRootPart" then
					value.Transparency = 1;
				end
			end
		end
	end
end);
