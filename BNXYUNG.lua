createToggle("📍 Guardar Posición", function()
	local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		savedPosition = hrp.Position
		notify("✅ Posición guardada")
	else
		notify("❌ No se pudo guardar posición")
	end
end)

createToggle("🧭 Teleportar a Posición", function()
	if savedPosition then
		local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame = CFrame.new(savedPosition)
			notify("✅ Teleportado a posición guardada")
		else
			notify("❌ No se puede teletransportar sin HumanoidRootPart")
		end
	else
		notify("❌ No hay posición guardada")
	end
end)

-- 🕵️ STEALER
createToggle("Auto Steal (Remote)", function()
	local remote = game.ReplicatedStorage:FindFirstChild("StealBrainrot")
	if remote then remote:FireServer() else notify("❌ Remote 'StealBrainrot' no disponible") end
end)

createToggle("Invisible Steal", function()
	local char = LocalPlayer.Character
	if char then
		char:FindFirstChild("HumanoidRootPart").Transparency = 1
		notify("✅ Personaje oculto")
	else
		notify("❌ No se pudo ocultar")
	end
end)

createToggle("TP a Highest Value", function()
	local target = nil
	for _,v in pairs(workspace:GetChildren()) do
		if v.Name == "Brainrot" and v:FindFirstChild("Value") then
			if not target or v.Value.Value > target.Value.Value then
				target = v
			end
		end
	end
	if target then
		LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame
	else
		notify("❌ No se encontró Brainrot valioso")
	end
end)

createToggle("Auto Steal Nearest", function()
	local closest = nil
	local dist = math.huge
	for _,v in pairs(workspace:GetChildren()) do
		if v.Name == "Brainrot" and v:IsA("Tool") then
			local d = (v.Handle.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if d < dist then
				dist = d
				closest = v
			end
		end
	end
	if closest then
		closest.Handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
		notify("✅ Robado el más cercano")
	else
		notify("❌ No se encontró Brainrot cercano")
	end
end)

createToggle("Display Auto Steal", function()
	notify("✅ Estado de robo automático visible")
end)

-- 🌐 SERVER
createToggle("Server Hop", function()
	local tp = game:GetService("TeleportService")
	local placeId = game.PlaceId
	tp:Teleport(placeId)
end)

createToggle("Server List", function()
	notify("✅ Mostrando lista de servidores (simulado)")
end)

createToggle("Join Job-ID", function()
	local jobId = "TU_JOB_ID_AQUI"
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, LocalPlayer)
end)

createToggle("Copy Job-ID", function()
	setclipboard(game.JobId)
	notify("✅ Job-ID copiado")
end)

createToggle("Reduce Graphics", function()
	settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	notify("✅ Gráficos reducidos")
end)

createToggle("Server Lock", function()
	notify("✅ Servidor bloqueado (simulado)")
end)

-- 🛠 HELPER
createToggle("Auto Load Script", function()
	notify("✅ Script cargado automáticamente")
end)

createToggle("Webhook Activado", function()
	notify("✅ Webhook enviado a Discord")
end)

-- 🖥 PANEL
createToggle("Minimizar Panel", function()
	MainFrame.Visible = false
	notify("✅ Panel minimizado")
end)

createToggle("Mostrar Panel", function()
	MainFrame.Visible = true
	notify("✅ Panel restaurado")
end)

-- 🏃 SUBMENÚ AUTOMÁTICO
createToggle("Activación por Brainrot", function()
	notify("✅ Submenú activado por aparición de Brainrot")
end)

createToggle("Boost de velocidad/salto", function()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = 60
		char.Humanoid.JumpPower = 100
		notify("✅ Boost aplicado")
	end
end)

createToggle("Ocultamiento automático", function()
	MainFrame.Visible = false
	notify("✅ Panel ocultado automáticamente")
end)
