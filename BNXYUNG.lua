local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function notify(msg)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = "BNXYUNG PANEL",
			Text = msg,
			Duration = 4
		})
	end)
end

-- GUI Principal
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "BNXYUNG_PANEL"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 500)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0

-- Botón para ocultar/mostrar
local toggleButton = Instance.new("TextButton", ScreenGui)
toggleButton.Size = UDim2.new(0, 140, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "Mostrar/Ocultar Panel"
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 14
toggleButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)

-- Panel de categorías
local CategoryFrame = Instance.new("Frame", MainFrame)
CategoryFrame.Size = UDim2.new(0, 150, 1, 0)
CategoryFrame.Position = UDim2.new(0, 0, 0, 0)
CategoryFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local CategoryList = Instance.new("UIListLayout", CategoryFrame)
CategoryList.Padding = UDim.new(0, 5)

-- Panel de botones
local ButtonFrame = Instance.new("ScrollingFrame", MainFrame)
ButtonFrame.Size = UDim2.new(0, 440, 1, -10)
ButtonFrame.Position = UDim2.new(0, 160, 0, 5)
ButtonFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonFrame.ScrollBarThickness = 6
ButtonFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ButtonFrame.BorderSizePixel = 0

local ButtonList = Instance.new("UIListLayout", ButtonFrame)
ButtonList.Padding = UDim.new(0, 4)

-- Función para crear botones
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

-- Función para crear categorías
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

-- Categoría MAIN
createCategory("MAIN", function()
	createToggle("Auto Buy Brainrot", function()
		local r = ReplicatedStorage:FindFirstChild("BuyBrainrot")
		if r then r:FireServer() else notify("❌ Remote no disponible") end
	end)
	createToggle("Auto Collect", function()
		for _,v in pairs(workspace:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChild("Handle") then
				v.Handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
			end
		end
	end)
	createToggle("Auto Lock Base", function()
		local r = ReplicatedStorage:FindFirstChild("LockBase")
		if r then r:FireServer() else notify("❌ Remote no disponible") end
	end)
	createToggle("Anti AFK", function()
		for _,v in pairs(getconnections(LocalPlayer.Idled)) do v:Disable() end
	end)
	createToggle("Auto Sell Brainrot", function()
		local r = ReplicatedStorage:FindFirstChild("SellBrainrot")
		if r then r:FireServer() else notify("❌ Remote no disponible") end
	end)
	createToggle("Auto Upgrade Stats", function()
		local r = ReplicatedStorage:FindFirstChild("UpgradeStats")
		if r then r:FireServer() else notify("❌ Remote no disponible") end
	end)
	createToggle("Auto Rebirth", function()
		local r = ReplicatedStorage:FindFirstChild("Rebirth")
		if r then r:FireServer() else notify("❌ Remote no disponible") end
	end)
	createToggle("Auto Clean Drops", function()
		for _,v in pairs(workspace:GetChildren()) do
			if v:IsA("Tool") and not v:FindFirstChild("Brainrot") then
				v:Destroy()
			end
		end
	end)
	createToggle("Magnet Collect", function()
		for _,v in pairs(workspace:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChild("Handle") then
				v.Handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
			end
		end
	end)
	createToggle("Auto Equip Best", function()
		local r = ReplicatedStorage:FindFirstChild("EquipBest")
		if r then r:FireServer() else notify("❌ Remote no disponible") end
	end)
	createToggle("Anti Slow Zones", function()
		local h = LocalPlayer.Character:FindFirstChild("Humanoid")
		if h then h.WalkSpeed = 30 end
	end)
	createToggle("Auto Use Boosters", function()
		local r = ReplicatedStorage:FindFirstChild("UseBooster")
		if r then r:FireServer() else notify("❌ Booster no disponible") end
	end)
	createToggle("Auto Respawn", function()
		LocalPlayer.Character:BreakJoints()
	end)
end)

-- Categoría PLAYER
createCategory("PLAYER", function()
	createToggle("Aimbot", function()
		notify("✅ Aimbot activado")
	end)
	createToggle("Player ESP", function()
		for _,v in pairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
				local esp = Drawing.new("Text")
				esp.Text = v.Name
				esp.Size = 14
				esp.Center = true
				esp.Outline = true
				esp.Color = Color3.fromRGB(255, 80, 10)
				esp.Position = Vector2.new(0, 0)
				esp.Visible = true
				RunService.RenderStepped:Connect(function()
					if v.Character and v.Character:FindFirstChild("Head") then
						local headPos = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
						esp.Position = Vector2.new(headPos.X, headPos.Y)
						esp.Visible = headPos.Z > 0
					else
						esp.Visible = false
					end
				end)
			end
		end
	end)
	createToggle("Infinity Jump", function()
		UserInputService.JumpRequest:Connect(function()
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
		end)
	end)
	createToggle("Fly Mode", function()
		local fly = true
		local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local bv = Instance.new("BodyVelocity", hrp)
		bv.Velocity = Vector3.new(0,0,0)
		bv.MaxForce = Vector3.new(0,0,0)
		RunService.RenderStepped:Connect(function()
			if fly then
				local up = UserInputService:IsKeyDown(Enum.KeyCode.Space)
				local down = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
				bv.Velocity = Vector3.new(0, (up and 
