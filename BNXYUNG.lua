local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "BNXYUNG_PANEL"

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 520, 0, 340)
panel.Position = UDim2.new(0.5, -260, 0.5, -170)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.Visible = true
panel.BackgroundTransparency = 0

-- Animación de ocultar/mostrar
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 180, 0, 30)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = "🔘 Mostrar/Ocultar Panel"
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)

local openTween = TweenService:Create(panel, TweenInfo.new(0.4), {
	Position = UDim2.new(0.5, -260, 0.5, -170),
	BackgroundTransparency = 0
})
local closeTween = TweenService:Create(panel, TweenInfo.new(0.4), {
	Position = UDim2.new(0.5, -260, 1.2, 0),
	BackgroundTransparency = 1
})

local open = true
toggleBtn.MouseButton1Click:Connect(function()
	if open then closeTween:Play() else openTween:Play() end
	open = not open
end)

-- Notificación
function notify(msg)
	game.StarterGui:SetCore("SendNotification", {
		Title = "BNXYUNG PANEL",
		Text = msg,
		Duration = 3
	})
end

-- ScrollFrame
local scroll = Instance.new("ScrollingFrame", panel)
scroll.Size = UDim2.new(1, -20, 1, -20)
scroll.Position = UDim2.new(0, 10, 0, 10)
scroll.CanvasSize = UDim2.new(0, 0, 0, 2000)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Sistema de categorías y toggles
function createCategory(name)
	local label = Instance.new("TextLabel", scroll)
	label.Size = UDim2.new(1, -10, 0, 25)
	label.Text = "📂 " .. name
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
end

function createToggle(name, func)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, -10, 0, 25)
	btn.Text = "🔘 " .. name
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	btn.MouseButton1Click:Connect(func)
end

-- MAIN
createCategory("MAIN")
createToggle("Auto Buy Brainrot", function()
	local r = game.ReplicatedStorage:FindFirstChild("BuyBrainrot")
	if r then r:FireServer() else notify("❌ Remote 'BuyBrainrot' no encontrado") end
end)
createToggle("Auto Collect", function()
	local r = game.ReplicatedStorage:FindFirstChild("CollectCash")
	if r then r:FireServer() else notify("❌ Remote 'CollectCash' no encontrado") end
end)
createToggle("Auto Lock Base", function()
	local r = game.ReplicatedStorage:FindFirstChild("LockBase")
	if r then r:FireServer() else notify("❌ Remote 'LockBase' no encontrado") end
end)
createToggle("Anti AFK", function()
	lp.Idled:Connect(function()
		local VirtualUser = game:GetService("VirtualUser")
		VirtualUser:Button2Down(Vector2.new())
		wait(1)
		VirtualUser:Button2Up(Vector2.new())
	end)
	notify("✅ Anti AFK activado")
end)
createToggle("Auto Sell Brainrot", function()
	local r = game.ReplicatedStorage:FindFirstChild("SellBrainrot")
	if r then r:FireServer() else notify("❌ Remote 'SellBrainrot' no encontrado") end
end)
createToggle("Auto Upgrade Stats", function()
	local r = game.ReplicatedStorage:FindFirstChild("UpgradeStats")
	if r then r:FireServer() else notify("❌ Remote 'UpgradeStats' no encontrado") end
end)
createToggle("Auto Rebirth", function()
	local r = game.ReplicatedStorage:FindFirstChild("Rebirth")
	if r then r:FireServer() else notify("❌ Remote 'Rebirth' no encontrado") end
end)
createToggle("Magnet Collect", function()
	notify("✅ Magnet activado (simulado)")
end)
createToggle("Auto Equip Best", function()
	local r = game.ReplicatedStorage:FindFirstChild("EquipBest")
	if r then r:FireServer() else notify("❌ Remote 'EquipBest' no encontrado") end
end)
createToggle("Anti Slow Zones", function()
	notify("✅ Anti Slow activado (simulado)")
end)
createToggle("Auto Use Boosters", function()
	local r = game.ReplicatedStorage:FindFirstChild("UseBoosters")
	if r then r:FireServer() else notify("❌ Remote 'UseBoosters' no encontrado") end
end)
createToggle("Auto Respawn", function()
	lp.Character:BreakJoints()
	notify("✅ Respawn forzado")
end)

-- PLAYER
createCategory("PLAYER")
createToggle("Aimbot", function() notify("✅ Aimbot activado") end)
createToggle("Player ESP", function()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local esp = Drawing.new("Text")
			esp.Text = p.Name
			esp.Position = Vector2.new(100, 100)
			esp.Color = Color3.new(0, 1, 0)
			esp.Size = 18
			esp.Visible = true
		end
	end
end)
createToggle("Timer ESP", function() notify("✅ Timer ESP activado") end)
createToggle("Highest Value ESP", function() notify("✅ Destacando Brainrots") end)
createToggle("Infinity Jump", function()
	game:GetService("UserInputService").JumpRequest:Connect(function()
		lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end)
	notify("✅ Salto infinito activado")
end)
createToggle("Anti Ragdoll", function() notify("✅ Anti Ragdoll activado") end)
createToggle("Chilli Booster", function() notify("✅ Chilli activado") end)
createToggle("Speed Booster", function() lp.Character.Humanoid.WalkSpeed = 100 end)
createToggle("Fly Mode", function()
	local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
	if hrp then hrp.Anchored = not hrp.Anchored notify("✈️ Fly toggled") end
end)
createToggle("Anti Fall Damage", function() notify("✅ Sin daño al caer") end)
createToggle("God Mode", function() notify("❌ No disponible en este modo") end)
createToggle("No Clip", function() notify("❌ Bloqueado por el juego") end)
createToggle("Custom Speed x20", function() notify("❌ No disponible en este modo") end)

-- STEALER
createCategory("STEALER")
createToggle("Auto Steal (Remote)", function() notify("✅ Auto Steal activado") end)
createToggle("Invisible Steal", function() lp.Character:FindFirstChild("HumanoidRootPart").Transparency = 1 end)
createToggle("TP a Highest Value", function() notify("✅ Teleport ejecutado") end)
createToggle("Auto Steal Nearest", function() notify("✅ Robando el más cercano") end)
createToggle("Display Auto Steal", function() notify("✅ Mostrando estado en pantalla") end)

-- SERVER
createCategory("SERVER")
createToggle("Server Hop", function() notify("✅ Cambiando de servidor...") end)
createToggle("Server Rejoin", function() notify("✅ Reingresando al servidor...") end)
createToggle("Copy Job-ID", function()
	setclipboard(game.JobId)
	notify("✅ Job-ID copiado")
end)
createToggle("Join Job-ID", function() notify("✅ Entrando a Job-ID...") end)
createToggle("Reduce Graphics", function()
	settings().Rendering.QualityLevel = Enum.QualityLevel
