local function CreateEsp(Targ, Name)
    local bb = Instance.new("BillboardGui")
    bb.Name = "EspBillboard"
    bb.Parent = Targ
    
    local text = Instance.new("TextLabel", bb)
    text.Name = "EspLabel"
    text.Text = Name .. ":"
    
    local function UpdateDistance()
        while wait() do
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Targ.Character.HumanoidRootPart.Position).Magnitude
            text.Text = Name .. ": " .. distance
        end
    end
    
    coroutine.wrap(UpdateDistance)()
end
