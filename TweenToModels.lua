-- Defining the function
local function TweenPlayerToModel(player, model, speed)
    -- Make sure the model exists and is a descendant of the workspace
    if not model or not model:IsDescendantOf(game.Workspace) then
        return
    end
    
    -- Get the humanoid of the player
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if not humanoid then
        return
    end

    -- Calculate the distance between the player and the model
    local distance = (model:GetBoundingBox().p - humanoid.RootPart.Position).magnitude
    
    -- Calculate the time required to reach the model based on the speed
    local time = distance / speed
    
    -- Create a TweenInfo object with the time and easing style
    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
    
    -- Create the tween
    local tween = game:GetService("TweenService"):Create(
        humanoid.RootPart, -- Object to tween (player's root part)
        tweenInfo,         -- TweenInfo obj
        {CFrame = CFrame.new(model:GetBoundingBox().p)} -- Target CFrame (model's position)
    )
    
-- Actually making it work
    tween:Play()
    
    -- Wait for the tween to complete before completing
    tween.Completed:Wait()
end

-- Example usage: Call the function with a player and a model with a speed of 10
local player = game.Players.LocalPlayer
local modelToTweenTo = game.Workspace.Model -- Replace "Model" with the name of the desired model
local speed = 10

TweenPlayerToModel(player, modelToTweenTo, speed)
