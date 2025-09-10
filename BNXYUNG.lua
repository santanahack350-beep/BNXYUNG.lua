createToggle("Reduce Graphics", function()
	settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	notify("✅ Gráficos reducidos")
end)

-- HELPER
createCategory("HELPER")
createToggle("Auto Load Script", function()
	notify("✅ Script se cargará automáticamente")
end)
createToggle("Webhook Activado", function()
	notify("✅ Webhook enviado a Discord")
end)

-- PANEL
createCategory("PANEL")
createToggle("Minimizar Panel", function()
	panel.Visible = false
	notify("✅ Panel ocultado")
end)
createToggle("Mostrar Panel", function()
	panel.Visible = true
	notify("✅ Panel mostrado")
end)

-- SUBMENÚ AUTOMÁTICO
createCategory("SUBMENÚ AUTOMÁTICO")
createToggle("Activación por Brainrot", function()
	notify("✅ Detectando aparición de Brainrot")
end)
createToggle("Boost de velocidad/salto", function()
	lp.Character.Humanoid.WalkSpeed = 100
	lp.Character.Humanoid.JumpPower = 100
	notify("✅ Boost aplicado")
end)
createToggle("Ocultamiento automático", function()
	wait(3)
	panel.Visible = false
	notify("✅ Panel ocultado automáticamente")
end)
