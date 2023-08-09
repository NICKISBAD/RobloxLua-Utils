local function CreateESP(Name,Part,Size)
    local RunService = game:GetService("RunService")
    local player = game.Players.LocalPlayer
    local camera = game:GetService("Workspace").CurrentCamera

    local esp = Instance.new("BillboardGui")
    esp.Name = "esp"
    esp.Size = UDim2.new(0, 200, 0, 50)
    esp.StudsOffset = Vector3.new(0, 1.5, 0) -- Offset to raise the label slightly
    esp.Adornee = Part
    esp.Parent = Part
    esp.AlwaysOnTop = true


    local esplabelfr = Instance.new("TextLabel")
    esplabelfr.Name = "esplabelfr"
    esplabelfr.Size = UDim2.new(1, 0, 0, 70)
    esplabelfr.BackgroundColor3 = Color3.new(0, 0, 0)
    esplabelfr.TextColor3 = Color3.fromRGB(_G.Color)
    esplabelfr.BackgroundTransparency = 1
    esplabelfr.TextStrokeTransparency = 0
    esplabelfr.TextStrokeColor3 = Color3.new(0, 0, 0)
    esplabelfr.TextSize = Size
    esplabelfr.TextScaled = false
    esplabelfr.Parent = esp

    local function updateesplabelfr()
        local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if playerPosition then
            local distance = (playerPosition.Position - Part.Position).Magnitude
            esplabelfr.Text = string.format(Name .. ": %.2f", distance)
            
            local headPosition = Part.Position + Vector3.new(0, Part.Size.Y / 2, 0)
            local screenPosition, onScreen = camera:WorldToScreenPoint(headPosition)
            
            if onScreen or playerPosition.Position.Y > Part.Position.Y then
                esp.Adornee = Part
                esp.Enabled = true
            else
                esp.Enabled = false
            end
        else
            esp.Enabled = false
        end
    end

    RunService.RenderStepped:Connect(updateesplabelfr)
end
