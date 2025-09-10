-- BNXYUNG.lua | Panel modular para Delta (iPhone compatible)
-- GitHub-ready, scrollable, con funciones activables

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({
	Name = "🧠 BNXYUNG PANEL",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "BNXYUNG"
})

-- 📂 MAIN
local MainTab = Window:MakeTab({
	Name = "📂 MAIN",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddToggle({
	Name = "💸 Auto Buy Brainrot",
	Default = false,
	Callback = function(state)
		getgenv().AutoBuy = state
		while getgenv().AutoBuy do
			if workspace:FindFirstChild("Brainrot") and workspace.Brainrot:FindFirstChild("ClickDetector") then
				fireclickdetector(workspace.Brainrot.ClickDetector)
			end
			wait(1)
		end
	end
})

MainTab:AddToggle({
	Name = "🧲 Auto Collect",
	Default = false,
	Callback = function(state)
		getgenv().AutoCollect = state
		while getgenv().AutoCollect do
			for _,v in pairs(workspace:GetChildren()) do
				if v:IsA("Part") and v.Name == "Drop" then
					v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end
			wait(0.5)
		end
	end
})

MainTab:AddToggle({
	Name = "🔒 Auto Lock Base",
	Default = false,
	Callback = function(state)
		if state and game:GetService("ReplicatedStorage"):FindFirstChild("LockBase") then
			game:GetService("ReplicatedStorage").LockBase:FireServer(true)
		end
	end
})

MainTab:AddToggle({
	Name = "🛡️ Anti AFK",
	Default = true,
	Callback = function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end
})

MainTab:AddToggle({
	Name = "📈 Auto Upgrade Stats",
	Default = false,
	Callback = function(state)
		getgenv().AutoUpgrade = state
		while getgenv().AutoUpgrade do
			if game:GetService("ReplicatedStorage"):FindFirstChild("UpgradeStats") then
				game:GetService("ReplicatedStorage").UpgradeStats:FireServer()
			end
			wait(2)
		end
	end
})

MainTab:AddToggle({
	Name = "🔁 Auto Rebirth",
	Default = false,
	Callback = function(state)
		getgenv().AutoRebirth = state
		while getgenv().AutoRebirth do
			if game:GetService("ReplicatedStorage"):FindFirstChild("Rebirth") then
				game:GetService("ReplicatedStorage").Rebirth:FireServer()
			end
			wait(3)
		end
	end
})

MainTab:AddToggle({
	Name = "🧲 Magnet Collect",
	Default = false,
	Callback = function(state)
		getgenv().Magnet = state
		while getgenv().Magnet do
			for _,v in pairs(workspace:GetChildren()) do
				if v:IsA("Part") and v.Name == "Drop" then
					v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end
			wait(0.3)
		end
	end
})

MainTab:AddToggle({
	Name = "🧤 Auto Equip Best",
	Default = false,
	Callback = function(state)
		if state and game:GetService("ReplicatedStorage"):FindFirstChild("EquipBest") then
			game:GetService("ReplicatedStorage").EquipBest:FireServer()
		end
	end
})

MainTab:AddToggle({
	Name = "🚫 Anti Slow Zones",
	Default = false,
	Callback = function(state)
		if state then
			for _,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Part") and v.Name == "SlowZone" then
					v:Destroy()
				end
			end
		end
	end
})

MainTab:AddToggle({
	Name = "⚡ Auto Use Boosters",
	Default = false,
	Callback = function(state)
		getgenv().AutoBoost = state
		while getgenv().AutoBoost do
			local rs = game:GetService("ReplicatedStorage")
			if rs:FindFirstChild("UseBoost") then
				rs.UseBoost:FireServer("Speed")
				rs.UseBoost:FireServer("Jump")
			end
			wait(5)
		end
	end
})

MainTab:AddToggle({
	Name = "💀→🧍 Auto Respawn",
	Default = false,
	Callback = function(state)
		getgenv().AutoRespawn = state
		while getgenv().AutoRespawn do
			local char = game.Players.LocalPlayer.Character
			if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0 then
				if game:GetService("ReplicatedStorage"):FindFirstChild("Respawn") then
					game:GetService("ReplicatedStorage").Respawn:FireServer()
				end
			end
			wait(1)
		end
	end
})

-- 🔚 Inicializa el menú
OrionLib:Init()
