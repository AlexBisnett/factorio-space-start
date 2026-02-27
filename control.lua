script.on_init(function()
	if remote.interfaces["freeplay"] then
		remote.call("freeplay", "set_created_items", {})
		remote.call("freeplay", "set_respawn_items", {})

		remote.call("freeplay", "set_skip_intro", true)
		remote.call("freeplay", "set_disable_crashsite", true)
	end
end)

script.on_event(defines.events.on_player_created, function(event)
	local player = game.get_player(event.player_index)

	player.force.unlock_space_platforms()

	local platform = player.force.create_space_platform({
		name = "Deucalion",
		planet = "nauvis",
		starter_pack = "space-platform-starter-pack",
	})

	if platform then
		local hub = platform.apply_starter_pack()
		player.enter_space_platform(platform)

		player.force.lock_space_location("nauvis")

		hub.insert({ name = "solar-panel", count = 3 })
		hub.insert({ name = "asteroid-collector", count = 1 })
		hub.insert({ name = "crusher", count = 1 })
		hub.insert({ name = "electric-furnace", count = 1 })
		hub.insert({ name = "assembling-machine-1", count = 1 })
		hub.insert({ name = "inserter", count = 7 })
		hub.insert({ name = "transport-belt", count = 20 })
		hub.insert({ name = "space-platform-foundation", count = 40 })
	end
end)
