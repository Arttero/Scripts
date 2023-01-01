local client = game.Players.LocalPlayer;
local functions = functions or {};

function functions.respawn()
    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end;

function functions.create_baseplate()
    local baseplate = Instance.new("Part", workspace)
    baseplate.Name = "88299sdmjk902150320k"
    baseplate.Size = Vector3.new(1000, 1, 1000)
    baseplate.Position = Vector3.new(0, -100, 0)
    baseplate.CFrame = CFrame.new(500, -500, 500)
    baseplate.Anchored = true
    baseplate.CanCollide = false
    baseplate.Transparency = 0
end;

function functions.destroy_baseplate()
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "88299sdmjk902150320k" then
            v:Destroy()
        end
    end
end;

functions.destroy_baseplate()


spawn(function()
    while task.wait() do
        if getgenv().settings.ticket_farm == true then
            pcall(function()
                if not workspace:FindFirstChild("88299sdmjk902150320k") then
                    functions.create_baseplate()
                end
            end)
            
            pcall(function()
            client.Character.HumanoidRootPart.CFrame = CFrame.new(500, -497, 500)
            end)


            if client:GetAttribute('InMenu') == true then
                functions.respawn()
            else
                for i,v in pairs(game:GetService("Workspace").Game.Effects.Tickets:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") then
                        repeat task.wait()
                            pcall(function()
                                client.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            end)
                        until not v:FindFirstChild("HumanoidRootPart") or not getgenv().settings.ticket_farm
                    end
                end
            end
        end
    end
