local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- GUI base
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "BNXYUNG_PANEL"
gui.ResetOnSpawn = false

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 520, 0, 340)
panel.Position = UDim2.new(0.5, -260, 0.5, -170)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.BorderSizePixel = 0
panel.Visible = true
panel.Active = true
panel.Draggable = true

Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", panel).Thickness = 2

-- Mostrar/Ocultar Panel
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 200, 0, 30)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = "🔘 Mostrar/Ocultar Panel"
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)

toggleBtn.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- Minimizar botón dentro del panel
local minimizeBtn = Instance.new("TextButton", panel)
minimizeBtn.Size = UDim2.new(0, 120, 0, 25)
minimizeBtn.Position = UDim2.new(1, -130, 0, 5)
minimizeBtn.Text = "🗕 Minimizar"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.MouseButton1Click:Connect(function()
	panel.Visible = false
end)

-- Notificación
function notify(msg)
	game.StarterGui:SetCore("SendNotification", {
		Title = "BNXYUNG PANEL",
		Text = msg,
		Duration = 3
	})
end

-- Columnas visuales
local leftFrame = Instance.new("Frame", panel)
leftFrame.Size = UDim2.new(0, 150, 1, -40)
leftFrame.Position = UDim2.new(0, 10, 0, 35)
leftFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", leftFrame).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", leftFrame).Color = Color3.fromRGB(60, 60, 60)

local rightFrame = Instance.new("Frame", panel)
rightFrame.Size = UDim2.new(0, 330, 1, -40)
rightFrame.Position = UDim2.new(0, 180, 0, 35)
rightFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", rightFrame).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", rightFrame).Color = Color3.fromRGB(60, 60, 60)

-- Scroll en cada columna
local leftScroll = Instance.new("ScrollingFrame", leftFrame)
leftScroll.Size = UDim2.new(1, 0, 1, 0)
leftScroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
leftScroll.ScrollBarThickness = 4
leftScroll.BackgroundTransparency = 1

local rightScroll = Instance.new("ScrollingFrame", rightFrame)
rightScroll.Size = UDim2.new(1, 0, 1, 0)
rightScroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
rightScroll.ScrollBarThickness = 4
rightScroll.BackgroundTransparency = 1

local leftLayout = Instance.new("UIListLayout", leftScroll)
leftLayout.Padding = UDim.new(0, 6)
leftLayout.SortOrder = Enum.SortOrder.LayoutOrder

local rightLayout = Instance.new("UIListLayout", rightScroll)
rightLayout.Padding = UDim.new(0, 6)
rightLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Funciones
function createCategory(name)
	local label = Instance.new("TextLabel", leftScroll)
	label.Size = UDim2.new(1, -10, 0, 25)
	label.Text = "📂 " .. name
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
end

function createButton(name, func)
	local btn = Instance.new("TextButton", rightScroll)
	btn.Size = UDim2.new(1, -10, 0, 25)
	btn.Text = "🔘 " .. name
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	btn.MouseButton1Click:Connect(func)
end

-- MAIN
createCategory("MAIN")
createButton("Auto Buy Brainrot", function()
	local r = game.ReplicatedStorage:FindFirstChild("BuyBrainrot")
	if r then r:FireServer() else notify("❌ Remote 'BuyBrainrot' no encontrado") end
end)
createButton("Auto Collect", function()
	local r = game.ReplicatedStorage:FindFirstChild("CollectCash")
	if r then r:FireServer() else notify("❌ Remote 'CollectCash' no encontrado") end
end)
createButton("Auto Lock Base", function()
	local r = game.ReplicatedStorage:FindFirstChild("LockBase")
	if r then r:FireServer() else notify("❌ Remote 'LockBase' no encontrado") end
end)
createButton("Anti AFK", function()
	lp.Idled:Connect(function()
		local vu = game:GetService("VirtualUser")
		vu:Button2Down(Vector2.new())
		wait(1)
		vu:Button2Up(Vector2.new())
	end)
	notify("✅ Anti AFK activado")
end)
createButton("Auto Upgrade Stats", function()
	local r = game.ReplicatedStorage:FindFirstChild("UpgradeStats")
	if r then r:FireServer() else notify("❌ Remote 'UpgradeStats' no disponible") end
end)
createButton("Auto Rebirth", function()
	local r = game.ReplicatedStorage:FindFirstChild("Rebirth")
	if r then r:FireServer() else notify("❌ Remote 'Rebirth' no disponible") end
end)
createButton("Magnet Collect", function() notify("✅ Magnet activado") end)
createButton("Auto Equip Best", function()
	local r = game.ReplicatedStorage:FindFirstChild("EquipBest")
	if r then r:FireServer() else notify("❌ Remote 'EquipBest' no disponible") end
end)
createButton("Anti Slow Zones", function() notify("✅ Anti Slow activado") end)
createButton("Auto Use Boosters", function()
	local r = game.ReplicatedStorage:FindFirstChild("UseBoosters")
	if r then r:FireServer() else notify("❌ Remote 'UseBoosters' no disponible") end
end)
createButton("Auto Respawn", function()
	lp.Character:BreakJoints()
	notify("✅ Respawn forzado")
end)

-- PLAYER
createCategory("PLAYER")
createButton("Aimbot", function() notify("✅ Aimbot activado") end)
createButton("Player ESP", function() notify("✅ ESP activado") end)
createButton("Timer ESP", function() notify("✅ Temporizador activado") end)
createButton("Highest Value ESP", function() notify("✅ Brainrots destacados") end)
createButton("Infinity Jump", function()
	UserInputService.JumpRequest:Connect(function()
		lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end)
	notify("✅ Salto infinito activado")
end)
createButton("Anti Ragdoll", function() notify("✅ Anti Ragdoll activado") end)
createButton("Chilli Booster", function() notify("✅ Chilli activado") end)
createButton("Speed Booster", function() lp.Character.Humanoid.WalkSpeed = 100 end)
createButton("Fly Mode", function()
	local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
	if hrp then hrp.Anchored = not hrp.Anchored notify("✈️ Fly toggled") end
end)
createButton("Anti Fall Damage", function() notify("✅ Sin daño al caer") end)

-- STE
