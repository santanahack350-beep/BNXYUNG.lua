local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- GUI base
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "BNXYUNG_PANEL"

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 520, 0, 340)
panel.Position = UDim2.new(0.5, -260, 0.5, -170)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
panel.BorderSizePixel = 2
panel.Visible = true

-- Mostrar/Ocultar con animación
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 200, 0, 30)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = "🔘 Mostrar/Ocultar Panel"
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)

local openTween = TweenService:Create(panel, TweenInfo.new(0.3), {
	Position = UDim2.new(0.5, -260, 0.5, -170),
	BackgroundTransparency = 0
})
local closeTween = TweenService:Create(panel, TweenInfo.new(0.3), {
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

-- Columnas
local leftColumn = Instance.new("ScrollingFrame", panel)
leftColumn.Size = UDim2.new(0, 150, 1, -20)
leftColumn.Position = UDim2.new(0, 10, 0, 10)
leftColumn.CanvasSize = UDim2.new(0, 0, 0, 1000)
leftColumn.ScrollBarThickness = 4
leftColumn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local rightColumn = Instance.new("ScrollingFrame", panel)
rightColumn.Size = UDim2.new(0, 330, 1, -20)
rightColumn.Position = UDim2.new(0, 170, 0, 10)
rightColumn.CanvasSize = UDim2.new(0, 0, 0, 1000)
rightColumn.ScrollBarThickness = 4
rightColumn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local leftLayout = Instance.new("UIListLayout", leftColumn)
leftLayout.Padding = UDim.new(0, 6)
leftLayout.SortOrder = Enum.SortOrder.LayoutOrder

local rightLayout = Instance.new("UIListLayout", rightColumn)
rightLayout.Padding = UDim.new(0, 6)
rightLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Funciones
function createCategory(name)
	local label = Instance.new("TextLabel", leftColumn)
	label.Size = UDim2.new(1, -10, 0, 25)
	label.Text = "📂 " .. name
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
end

function createButton(name, func)
	local btn = Instance.new("TextButton", rightColumn)
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

-- PLAYER
createCategory("PLAYER")
createButton("Aimbot", function()
	notify("✅ Aimbot activado")
end)

-- STEALER
createCategory("STEALER")
createButton("Auto Steal", function()
	notify("✅ Auto Steal activado")
end)

-- SERVER
createCategory("SERVER")
createButton("Server Hop", function()
	notify("✅ Cambiando de servidor...")
end)
