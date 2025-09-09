local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- GUI principal
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "BNXYUNG_PANEL"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local scroll = Instance.new("ScrollingFrame", gui)
scroll.Size = UDim2.new(0, 300, 0, 400)
scroll.Position = UDim2.new(0, 20, 0.5, -200)
scroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
scroll.Active = true
scroll.Draggable = true

local title = Instance.new("TextLabel", scroll)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "BNXYUNG PANEL ROBLOX"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0, 0)

-- Función para crear botones
local function createToggle(name, yPos, callback)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, yPos)
	btn.Text = name .. ": OFF"
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14

	local state = false
	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.Text = name .. ": " .. (state and "ON" or "OFF")
		if callback then callback(state) end
		game.StarterGui:SetCore("SendNotification", {
			Title = "BNXYUNG PANEL";
			Text = name .. " " .. (state and "Activado" or "Desactivado");
			Duration = 3;
		})
	end)
end

-- Funciones reales
createToggle("Auto Steal", 40, function(state)
	local remote = ReplicatedStorage:FindFirstChild("StealBrainrot")
	if remote and state then
		while state do
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= LocalPlayer then
					remote:FireServer(player.Name)
				end
			end
			wait(2)
		end
	end
end)

createToggle("TP a Base", 80, function(state)
	if state then
		local bases = workspace:FindFirstChild("Bases")
		if bases then
			local base = bases:FindFirstChild(LocalPlayer.Name)
			if base and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				LocalPlayer.Character.HumanoidRootPart.CFrame = base.CFrame + Vector3.new(0,2,0)
			end
		end
	end
end)

createToggle("Invisibilidad", 120, function(state)
	if state then
		local char = LocalPlayer.Character
		if not char then return end
		for _, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Transparency = 1
				part.CanCollide = false
			elseif part:IsA("Decal") or part:IsA("Texture") then
				part.Transparency = 1
			elseif part:IsA("Accessory") or part:IsA("Clothing") or part:IsA("ShirtGraphic") then
				part:Destroy()
			end
		end
		if char:FindFirstChild("Humanoid") then
			char.Humanoid.NameDisplayDistance = 0
			char.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		end
	end
end)

createToggle("Auto Dinero", 160, function(state)
	if state then
		local remote = ReplicatedStorage:FindFirstChild("CollectMoney")
		if remote then remote:FireServer() end
	end
end)

createToggle("Comprar Brainrot OP", 200, function(state)
	if state then
		local remote = ReplicatedStorage:FindFirstChild("BuyBrainrot")
		if remote then remote:FireServer("GodOP") end
	end
end)

createToggle("NoClip", 240, function(state)
	if state then
		local char = LocalPlayer.Character
		if char then
			for _, part in pairs(char:GetChildren()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end
	end
end)

createToggle("Auto Revive", 280, function(state)
	if state then
		LocalPlayer.CharacterAdded:Connect(function()
			wait(1)
			local bases = workspace:FindFirstChild("Bases")
			if bases then
				local base = bases:FindFirstChild(LocalPlayer.Name)
				if base and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					LocalPlayer.Character.HumanoidRootPart.CFrame = base.CFrame + Vector3.new(0,2,0)
				end
			end
		end)
	end
end)

-- Botón flotante para minimizar
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 100, 0, 30)
toggleBtn.Position = UDim2.new(0, 20, 0.5, 220)
toggleBtn.Text = "Mostrar Panel"
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.Visible = false

local function minimize()
	scroll.Visible = false
	toggleBtn.Visible = true
end

toggleBtn.MouseButton1Click:Connect(function()
	scroll.Visible = true
	toggleBtn.Visible = false
end)

createToggle("Minimizar Panel", 320, function(state)
	if state then minimize() end
end)
