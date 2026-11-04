print("Hello world, from server!")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Brainrots = require(ReplicatedStorage.Shared.Config.Brainrots)

print(Brainrots.la_vacca.multiplier)
