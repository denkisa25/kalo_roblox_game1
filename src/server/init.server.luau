print("Hello world, from server!")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Brainrots = require(ReplicatedStorage.Shared.Config.Brainrots)

print(Brainrots.la_vacca.multiplier)
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	print(player.Name .. " joined!")
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local rotJuice = Instance.new("IntValue")
	rotJuice.Name = "Rot Juice"
	rotJuice.Value = 0
	rotJuice.Parent = leaderstats
end)
