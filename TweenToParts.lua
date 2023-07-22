-- Function to tween the player to a specified part with a given speed
local function TweenPlayerToPart(player, part, speed)
    -- Make sure the part exists and is a descendant of the workspace
    if not part or not part:IsDescendantOf(game.Workspace) then
        return
    end
    
    -- Get the humanoid of the player
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if not humanoid then
        return
    end

    -- Calculate the distance between the player and the part
    local distance = (part.Position - humanoid.RootPart.Position).magnitude
    
    -- Calculate the time required to reach the part based on the speed
    local time = distance / speed
    
    -- Create a TweenInfo object with the time and easing style
    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
    
    -- Create the tween
    local tween = game:GetService("TweenService"):Create(
        humanoid.RootPart, -- Object to tween (player's root part)
        tweenInfo,         -- TweenInfo object
        {CFrame = CFrame.new(part.Position)} -- Target CFrame (part's position)
    )
    
    -- Play the tween
    tween:Play()
    
    -- Wait for the tween to complete before returning
    tween.Completed:Wait()
end

-- Example usage: Call the function with a player and a part with a speed of 10
local player = game.Players.LocalPlayer
local partToTweenTo = game.Workspace.Part -- Replace "Part" with the name of the desired part
local speed = 10

TweenPlayerToPart(player, partToTweenTo, speed)
