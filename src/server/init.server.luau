print("Hello world, from server!")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Brainrots = require(ReplicatedStorage.Shared.Config.Brainrots)
local Tap = require(ReplicatedStorage.Shared.Config.Tap)

local tapEvent = Instance.new("RemoteEvent")
tapEvent.Name = "Tap"
tapEvent.Parent = ReplicatedStorage

print(Brainrots.la_vacca.multiplier)
local Players = game:GetService("Players")
local playerData = {}

Players.PlayerAdded:Connect(function(player)
	playerData[player] = {
		rotJuice = 0,
		brainrots = {},
	}

	print(player.Name .. " joined!")
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local rotJuice = Instance.new("IntValue")
	rotJuice.Name = "Rot Juice"
	rotJuice.Value = 0
	rotJuice.Parent = leaderstats
end)

Players.PlayerRemoving:Connect(function(player)
	playerData[player] = nil
end)

tapEvent.OnServerEvent:Connect(function(player)
	local data = playerData[player]
	data.rotJuice = data.rotJuice + Tap.baseReward
	player.leaderstats["Rot Juice"].Value = data.rotJuice
end)
