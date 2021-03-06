--// Anti exploit protection
getgenv().synSpy = {
    spyPrint              = warn;
    disableMessageOut     = true;
    disableErrorDetection = true;
    disableLocalKick      = true;
    helpMessage           = false;
    hiddenRemotes         = {
        
    }
}

xpcall(function()
    loadstring(game:HttpGet("https://github.com/Synthetic6969/lua-projects/raw/main/SynSpy.lua"))()
end, rconsolewarn)

--// Speed & Jump
xpcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Synthetic6969/lua-projects/main/SynSpeed.lua"))()()
end, rconsolewarn)

--// Kill all
local player = game:service'Players'.LocalPlayer

function stab(target, distance)
    local musket = player.Character:FindFirstChild("Musket") or player.Backpack:FindFirstChild("Musket")
    musket.Server.BayonetRemote:FireServer(0, target)
end

function stabToDeath(target)
    player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame-- * CFrame.new(0, -5, 0)
    wait(.25)
    stab(target)
    wait(.25)
    player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame-- * CFrame.new(0, -5, 0)
    wait(.25)
    stab(target)
    wait(.25)
end

local toggled = false
game:service'UserInputService'.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F5 then
        toggled = not toggled
    end
end)

while true do
    for _, target in next, game:service'Players':GetPlayers() do
        if toggled and player.Team ~= target.Team and target.Character then
            xpcall(function()
                stabToDeath(target)
            end, warn)
        end
    end
    wait()
end
