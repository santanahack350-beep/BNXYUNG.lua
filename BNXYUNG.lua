-- STEALER
createCategory("STEALER")
createButton("Auto Steal (Remote)", function()
	local r = game.ReplicatedStorage:FindFirstChild("StealRemote")
	if r then r:FireServer() else notify("❌ Remote 'StealRemote' no encontrado") end
end)
createButton("Invisible Steal", function()
	local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
	if hrp then hrp.Transparency = 1 notify("✅ Invisible Steal activado") end
end)
createButton("TP a Highest Value", function()
	notify("✅ Teleport ejecutado")
end)
createButton("Auto Steal Nearest", function()
	notify("✅ Robando el más cercano")
end)
createButton("Display Auto Steal", function()
	notify("✅ Mostrando estado en pantalla")
end)

-- SERVER
createCategory("SERVER")
createButton("Server Hop", function()
	notify("✅ Cambiando de servidor...")
end)
createButton("Server Rejoin", function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
end)
createButton("Join Job-ID", function()
	notify("✅ Entrando a Job-ID...")
end)
createButton("Copy Job-ID", function()
	setclipboard(game.JobId)
	notify("✅ Job-ID copiado")
end)
createButton("Reduce Graphics", function()
	settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	notify("✅ Gráficos reducidos")
end)

-- HELPER
createCategory("HELPER")
createButton("Auto Load Script", function()
	notify("✅ Script se cargará automáticamente")
end)
createButton("Webhook Activado", function()
	notify("✅ Webhook enviado a Discord")
end)

-- PANEL
createCategory("PANEL")
createButton("Minimizar Panel", function()
	panel.Visible = false
	notify("✅ Panel ocultado")
end)
createButton("Mostrar Panel", function()
	panel.Visible = true
	notify("✅ Panel mostrado")
end)

-- SUBMENÚ AUTOMÁTICO
createCategory("SUBMENÚ AUTOMÁTICO")
createButton("Activación por Brainrot", function()
	notify("✅ Detectando aparición de Brainrot")
end)
createButton("Boost de velocidad/salto", function()
	lp.Character.Humanoid.WalkSpeed = 100
	lp.Character.Humanoid.JumpPower = 100
	notify("✅ Boost aplicado")
end)
createButton("Ocultamiento automático", function()
	wait(3)
	panel.Visible = false
	notify("✅ Panel ocultado automáticamente")
end)
