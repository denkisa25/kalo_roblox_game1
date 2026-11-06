print("Hello world, from client!")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local tapEvent = ReplicatedStorage:WaitForChild("Tap")

UserInputService.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("I clicked!")
		tapEvent:FireServer()
	end
end)
