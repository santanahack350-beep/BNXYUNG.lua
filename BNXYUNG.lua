local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- GUI principal
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "BNXYUNG_PANEL"
gui.ResetOnSpawn = false

local scroll = Instance.new("ScrollingFrame", gui)
scroll.Size = UDim2.new(0, 350, 0, 500)
scroll.Position = UDim2.new(0, 20, 0.5, -250)
scroll.CanvasSize = UDim2.new(0, 0, 0, 2500)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scroll.Active = true
scroll.Draggable = true

local title = Instance.new("TextLabel", scroll)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "BNXYUNG PANEL ROBLOX 🔥"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0, 0)

-- Función para crear botones
local yOffset = 50
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
		game.StarterGui:SetCore("SendNotification", {
			Title = "BNXYUNG PANEL";
			Text = name .. " " .. (state and "Activado" or "Desactivado");
			Duration = 3;
		})
	end)

	yOffset += 40
end

-- 🔧 FUNCIONES REALES
createToggle("Auto Steal", function(state)
	if state then
		local remote = ReplicatedStorage:FindFirstChild("StealBrainrot")
		if remote then
			while state do
				for _, player in pairs(Players:GetPlayers()) do
					if player ~= LocalPlayer then
						remote:FireServer(player.Name)
					end
				end
				wait(2)
			end
		end
	end
end)

createToggle("TP a Highest Value", function(state)
	if state then
		local brainrots = workspace:FindFirstChild("Brainrots")
		if brainrots then
			local highest = nil
			for _, b in pairs(brainrots:GetChildren()) do
				if not highest or b.Value > highest.Value then
					highest = b
				end
			end
			if highest and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				LocalPlayer.Character.HumanoidRootPart.CFrame = highest.CFrame + Vector3.new(0,2,0)
			end
		end
	end
end)

createToggle("Invisible Steal", function(state)
	if state then
		local char = LocalPlayer.Character
		if char then
			for _, part in pairs(char:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Transparency = 1
					part.CanCollide = false
				elseif part:IsA("Decal") or part:IsA("Texture") then
					part.Transparency = 1
				elseif part:IsA("Accessory") then
					part:Destroy()
				end
			end
		end
	end
end)

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

createToggle("Auto Steal Nearest", function(state)
	if state then
		local remote = ReplicatedStorage:FindFirstChild("StealBrainrot")
		if remote then
			while state do
				local closest = nil
				local dist = math.huge
				for _, b in pairs(workspace:GetChildren()) do
					if b.Name == "Brainrot" and b:IsA("Part") then
						local d = (LocalPlayer.Character.HumanoidRootPart.Position - b.Position).Magnitude
						if d < dist then
							dist = d
							closest = b
						end
					end
				end
				if closest then
					remote:FireServer(closest.Name)
				end
				wait(2)
			end
		end
	end
end)

createToggle("Player ESP", function(state)
	if state then
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local billboard = Instance.new("BillboardGui", player.Character.HumanoidRootPart)
				billboard.Size = UDim2.new(0, 100, 0, 40)
				billboard.AlwaysOnTop = true
				local label = Instance.new("TextLabel", billboard)
				label.Size = UDim2.new(1, 0, 1, 0)
				label.Text = player.Name
				label.TextColor3 = Color3.fromRGB(255, 0, 0)
				label.BackgroundTransparency = 1
			end
		end
	end
end)

createToggle("Aimbot", function(state)
	if state then
		local mouse = LocalPlayer:GetMouse()
		game:GetService("RunService").RenderStepped:Connect(function()
			local target = nil
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					target = player.Character.HumanoidRootPart
					break
				end
			end
			if target and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
				mouse.TargetFilter = target
				LocalPlayer.Character.Humanoid:MoveTo(target.Position)
			end
		end)
	end
end)

createToggle("Infinity Jump", function(state)
	if state then
		game:GetService("UserInputService").JumpRequest:Connect(function()
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
				LocalPlayer.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	end
end)

createToggle("Anti AFK", function(state)
	if state then
		for _, v in pairs(getconnections(LocalPlayer.Idled)) do
			v:Disable()
		end
	end
end)

createToggle("Server Hop", function(state)
	if state then
		local tp = game:GetService("TeleportService")
		local servers = {}
		local req = syn and syn.request or http and http.request or http_request
		local response = req({
			Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
		})
		local data = game:GetService("HttpService"):JSONDecode(response.Body)
		for _, server in pairs(data.data) do
			if server.playing < server.maxPlayers then
				tp:TeleportToPlaceInstance(game.PlaceId, server.id)
				break
			end
		end
	end
end)

createToggle("Reduce Graphics", function(state)
	if state then
		for _, obj in pairs(workspace:GetDescendants()) do
			if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
				obj.Enabled = false
			elseif obj:IsA("Texture")
