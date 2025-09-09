local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- GUI principal
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "BNXYUNG_PANEL"
gui.ResetOnSpawn = false

-- Minimizar botón
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 120, 0, 30)
toggleBtn.Position = UDim2.new(0, 20, 0.5, 230)
toggleBtn.Text = "Mostrar Panel"
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.Visible = false

-- Contenedor principal con scroll
local scroll = Instance.new("ScrollingFrame", gui)
scroll.Size = UDim2.new(0, 350, 0, 500)
scroll.Position = UDim2.new(0, 20, 0.5, -250)
scroll.CanvasSize = UDim2.new(0, 0, 0, 2500)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scroll.Active = true
scroll.Draggable = true

-- Título
local title = Instance.new("TextLabel", scroll)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "BNXYUNG PANEL ROBLOX 🔥"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0, 0)

-- Función para crear secciones
local yOffset = 50
local function createSection(name)
	local section = Instance.new("TextLabel", scroll)
	section.Size = UDim2.new(1, -20, 0, 30)
	section.Position = UDim2.new(0, 10, 0, yOffset)
	section.Text = "— " .. name .. " —"
	section.TextColor3 = Color3.fromRGB(0, 255, 255)
	section.Font = Enum.Font.GothamBold
	section.TextSize = 16
	section.BackgroundTransparency = 1
	yOffset += 35
end

-- Función para crear botones
local function createToggle(name, callback)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Position = UDim2.new(0, 10, 0, yOffset)
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
		StarterGui:SetCore("SendNotification", {
			Title = "BNXYUNG PANEL";
			Text = name .. " " .. (state and "Activado" or "Desactivado");
			Duration = 3;
		})
	end)

	yOffset += 40
end

-- Submenú de velocidad y salto
local speedMenu = Instance.new("Frame", gui)
speedMenu.Size = UDim2.new(0, 200, 0, 100)
speedMenu.Position = UDim2.new(0.5, -100, 0.5, -50)
speedMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
speedMenu.Visible = false

local speedLabel = Instance.new("TextLabel", speedMenu)
speedLabel.Size = UDim2.new(1, 0, 0, 30)
speedLabel.Text = "Modo Rápido Activado"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 16
speedLabel.BackgroundTransparency = 1

-- Activar velocidad y salto
local function activateSpeed()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = 24  -- 70% boost
		char.Humanoid.JumpPower = 70
		speedMenu.Visible = true
		wait(5)
		speedMenu.Visible = false
	end
end

-- Detectar si el jugador agarra un Brainrot
workspace.ChildAdded:Connect(function(obj)
	if obj.Name == "Brainrot" and obj:IsDescendantOf(LocalPlayer.Character) then
		activateSpeed()
	end
end)

-- 🔧 CATEGORÍAS Y FUNCIONES
createSection("Main")
createToggle("Auto Buy Brainrot", function(state) end)
createToggle("Auto Collect", function(state) end)
createToggle("Auto Lock Base", function(state) end)
createToggle("Anti AFK", function(state)
	if state then
		for _, v in pairs(getconnections(LocalPlayer.Idled)) do
			v:Disable()
		end
	end
end)

createSection("Stealer")
createToggle("Auto Steal", function(state) end)
createToggle("Invisible Steal", function(state) end)
createToggle("TP a Highest Value", function(state) end)
createToggle("Auto Steal Nearest", function(state) end)
createToggle("Display Auto Steal", function(state)
	if state then
		local label = Instance.new("TextLabel", gui)
		label.Size = UDim2.new(0, 200, 0, 30)
		label.Position = UDim2.new(0.5, -100, 0, 10)
		label.Text = "Auto Steal Activado"
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1
		label.Font = Enum.Font.GothamBold
		label.TextSize = 16
		wait(5)
		label:Destroy()
	end
end)

createSection("Player")
createToggle("Aimbot", function(state) end)
createToggle("Player ESP", function(state) end)
createToggle("Timer ESP", function(state) end)
createToggle("Highest Value ESP", function(state) end)
createToggle("Infinity Jump", function(state)
	if state then
		UIS.JumpRequest:Connect(function()
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
				LocalPlayer.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	end
end)
createToggle("Anti Ragdoll", function(state) end)
createToggle("Chilli Booster", function(state) end)
createToggle("Speed Boost", function(state)
	if state then activateSpeed() end
end)

createSection("Server")
createToggle("Server Hop", function(state) end)
createToggle("Join Job-ID", function(state) end)
createToggle("Copy Job-ID", function(state) end)
createToggle("Reduce Graphics", function(state)
	if state then
		for _, obj in pairs(workspace:GetDescendants()) do
			if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
				obj.Enabled = false
			elseif obj:IsA("Texture") or obj:IsA("Decal") then
				obj.Transparency = 1
			end
		end
	end
end)

createSection("Helper")
createToggle("Auto Load Script", function(state) end)
createToggle("Webhook Activado", function(state)
	if state then
		local url = "TU_WEBHOOK_AQUI"
		local http = game:GetService("HttpService")
		local data = {
			content = "BNXYUNG PANEL ACTIVADO 🔥",
			username = "BNXYUNG"
		}
		http:PostAsync(url, http:JSONEncode(data))
	end
end)

-- Minimizar función
createToggle("Minimizar
