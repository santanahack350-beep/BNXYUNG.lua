local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local savedPosition = nil

function notify(msg)
	game.StarterGui:SetCore("SendNotification", {
		Title = "BNXYUNG PANEL",
		Text = msg,
		Duration = 4
	})
end

-- 🖥️ GUI Principal
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "BNXYUNG_PANEL"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 500)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0

-- 🔘 Botón para ocultar/mostrar
local toggleButton = Instance.new("TextButton", ScreenGui)
toggleButton.Size = UDim2.new(0, 120, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "Mostrar/Ocultar Panel"
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 14
toggleButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)

-- 🧭 Panel de categorías
local CategoryFrame = Instance.new("Frame", MainFrame)
CategoryFrame.Size = UDim2.new(0, 150, 1, 0)
CategoryFrame.Position = UDim2.new(0, 0, 0, 0)
CategoryFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local CategoryList = Instance.new("UIListLayout", CategoryFrame)
CategoryList.Padding = UDim.new(0, 5)

-- 🎛️ Panel de botones
local ButtonFrame = Instance.new("ScrollingFrame", MainFrame)
ButtonFrame.Size = UDim2.new(0, 440, 1, -10)
ButtonFrame.Position = UDim2.new(0, 160, 0, 5)
ButtonFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonFrame.ScrollBarThickness = 6
ButtonFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ButtonFrame.BorderSizePixel = 0

local ButtonList = Instance.new("UIListLayout", ButtonFrame)
ButtonList.Padding = UDim.new(0, 4)

-- 🧠 Función para crear botones
function createToggle(name, callback)
	local button = Instance.new("TextButton")
	button.Text = name
	button.Size = UDim2.new(1, -10, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 16
	button.Parent = ButtonFrame
	button.MouseButton1Click:Connect(function()
		callback(true)
	end)
end

-- 📂 Función para crear categoría
function createCategory(name, callback)
	local catButton = Instance.new("TextButton")
	catButton.Text = name
	catButton.Size = UDim2.new(1, -10, 0, 30)
	catButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	catButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	catButton.Font = Enum.Font.SourceSansBold
	catButton.TextSize = 16
	catButton.Parent = CategoryFrame
	catButton.MouseButton1Click:Connect(function()
		for _,v in pairs(ButtonFrame:GetChildren()) do
			if v:IsA("TextButton") then v:Destroy() end
		end
		callback()
	end)
end
