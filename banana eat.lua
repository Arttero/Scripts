local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()
local supportedPlaceIds = {4448566543} -- replace with the supported Place IDs

local gamePlaceId = game.PlaceId

local isPlaceIdSupported = false
for i, placeId in ipairs(supportedPlaceIds) do
    if gamePlaceId == placeId then
        isPlaceIdSupported = true
        break
    end
end

if not isPlaceIdSupported then
    game.Players.LocalPlayer:Kick("Sorry, this game is not supported by my script.")
end

local Luxt = Luxtl.CreateWindow("Arttero's Hub", 6105620301)

local autofarmTab = Luxt:Tab("Auto-Farm", 6087485864)
local plrTab = Luxt:Tab("Player")
local espTab = Luxt:Tab("Esp")
local teleportTab = Luxt:Tab("Teleport")
local creditsTab = Luxt:Tab("Credits")
local cf = creditsTab:Section("Main Credits")
cf:Credit("Arttero: Main Coding")
local cf1 = creditsTab:Section("UI Credits")
cf1:Credit("xHeptc: UI Library")
--esp
local esp = espTab:Section("ESP")
esp:Label("All types of esp")
--BANANA ESP
esp:Toggle("Banana Esp", function(isToggled)
    local teamColor = { -- team color table
    ["Banana"] = Color3.fromRGB(255, 255, 0)
}

-- function to check if player's team is supported
local function isSupportedTeam(player)
    local team = player.Team
    return teamColor[team.Name] ~= nil -- returns true if team is supported
end

-- toggle function
local function toggleEsp()
    enabled = isToggled
    for _, player in ipairs(game.Players:GetPlayers()) do
        if isSupportedTeam(player) and player.Character then
            local esp = player.Character:FindFirstChild(player.Name)
            if enabled then
                if not esp then
                    esp = Instance.new("Highlight")
                    esp.Name = player.Name
                    esp.OutlineColor =teamColor[player.Team.Name]
                    esp.FillTransparency = 1
                    esp.FillColor = Color3.new(1, 0.666667, 0)
                    esp.OutlineTransparency = 0
                    esp.Parent = player.Character
                end
            else
                if esp then
                    esp:Destroy()
                end
            end
        end
    end
end
toggleEsp()
    print(isToggled)
end) 
--SURV ESP
esp:Toggle("Runners Esp", function(isToggled)
    local teamColor = { -- team color table
    ["Runners"] = Color3.fromRGB(0, 255, 0)
}

-- function to check if player's team is supported
local function isSupportedTeam(player)
    local team = player.Team
    return teamColor[team.Name] ~= nil -- returns true if team is supported
end

-- toggle function
local function toggleEsp()
    enabled = isToggled
    for _, player in ipairs(game.Players:GetPlayers()) do
        if isSupportedTeam(player) and player.Character then
            local esp = player.Character:FindFirstChild(player.Name)
            if enabled then
                if not esp then
                    esp = Instance.new("Highlight")
                    esp.Name = player.Name
                    esp.OutlineColor =teamColor[player.Team.Name]
                    esp.FillTransparency = 1
                    esp.FillColor = Color3.new(1, 0.666667, 0)
                    esp.OutlineTransparency = 0
                    esp.Parent = player.Character
                end
            else
                if esp then
                    esp:Destroy()
                end
            end
        end
    end
end
toggleEsp()
    print(isToggled)
end)

--test
ff:Toggle("Toggle Me!", function(isToggled)
    print(isToggled) -- prints true or false
end)
ff:KeyBind("Print('Hey') on bind", Enum.KeyCode.R, function() --Enum.KeyCode.R is starting Key
    print('Hey')
end)
ff:TextBox("TextBox Info", "Epic PlaceHolder", function(getText)
    print(getText) -- Prints whatever player types
end)
ff:Slider("WalkSpeed", 16, 503, function(currentValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = currentValue 
end)
ff:DropDown("Favorite Food?", {"Pizza", "Burger", "Sandwiches"}, function(food) -- food is chosen item
    print(food)
end)