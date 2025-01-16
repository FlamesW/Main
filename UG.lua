-- // Hello skid, what brings you here? :)
repeat task.wait(0.25) until game:IsLoaded();
if not getgenv().CurrentVersion then
    game:Shutdown(); -- // GRRRRRRRRRRRRRRRRRRRRRRRRRR why is the version variable not assigned >:( ?
end

local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))();

local Window = WindUI:CreateWindow({
    Title = "Flameware "..tostring(getgenv().CurrentVersion),
    Icon = "rbxassetid://100500296638402",
    Author = "flames9925",
    Size = UDim2.fromOffset(580,480),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = true,
})

-- // Variables \\ --
local BoxingPath = workspace.punchingMachines["Punching Machine"];
local CleaningPath = workspace.DirtParts;
local LPlayer = game.Players.LocalPlayer;
local BackPack = LPlayer.Backpack;
local Char = LPlayer.Character;
LPlayer.DevCameraOcclusionMode = "Invisicam";

-- // Anti AFK \\ --
task.spawn(function()
    if not getgenv().AntiAfkLoaded == true then getgenv().AntiAfkLoaded = true;
        while true do task.wait(1100);
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftBracket",false,game);
            end)
        end
    end
end)

local HomeTab = Window:Tab({
    Title = "Information",
    Icon = "info",
})

local Divider = Window:Divider();

local Paragraph = HomeTab:Paragraph({
    Title = "Info",
    Desc = "This script is open source, But its not connected to the settings. this script also is unlikely to ever get updated.",
    Image = "info"
})

HomeTab:Toggle({Title = "Auto Claim Time Rewards",Desc = 'This will claim time rewards for you.',Value = true,Callback = function(Value)
    getgenv().AutoClaimTimeRewards = Value;

    while getgenv().AutoClaimTimeRewards == true do 
        pcall(function()
            local args = {[1] = "reward1"};
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("rewards"):FireServer(unpack(args));
            local args = {[1] = "reward2"};
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("rewards"):FireServer(unpack(args));
            local args = {[1] = "reward3"};
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("rewards"):FireServer(unpack(args));   
            local args = {[1] = "reward4"};
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("rewards"):FireServer(unpack(args));  
            local args = {[1] = "reward5"};
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("rewards"):FireServer(unpack(args));     
        end)      
        task.wait(5);
    end    
end,})

local FarmingTab = Window:Tab({
    Title = "Training",
    Icon = "biceps-flexed",
})

local FarmingSectionTab = FarmingTab:Section({ 
    Title = "Training Tab",
    TextSize = 22,
})

local TrainingParagraph = FarmingTab:Paragraph({
    Title = "Important Info",
    Desc = "You must be near a training equipment for these features to work.",
    Image = "info"
})

local TrainingSection = FarmingTab:Section({ 
    Title = "Training Features",
    TextXAlignment = "Center"
})

FarmingTab:Toggle({Title = "Auto Use Machine",Desc = 'This will replicate the "Auto Train" gamepass.',Value = false,Callback = function(Value)
    getgenv().AutoUseMachine = Value

    while getgenv().AutoUseMachine == true do 
        pcall(function()
            local args = {[1] = "Click"};
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args));
        end)      
        task.wait(0.035);
    end    
end,})

FarmingTab:Toggle({Title = "Auto Use Energy Drink",Desc = "This will equip and use your energy drink.",Value = false,Callback = function(Value)
    getgenv().AutoUseEnergyDrink = Value;

    while getgenv().AutoUseEnergyDrink == true do 
        pcall(function()
            Char.Humanoid:EquipTool(LPlayer.Backpack:FindFirstChild("Energy Drink"));
            Char:FindFirstChild("Energy Drink"):Activate();
        end)
        task.wait(0.5);
    end 
end,})

FarmingTab:Dropdown({Title = "Select Difficulty",Desc = "Select your difficulty for the boxing machine.",Multi = false,Value = "Easy",AllowNone = true,Values = {"Easy","Medium","Hard","Extreme","Insanity","Godly"},Callback = function(DropdownValue)
    WindUI:Notify({Title = "Flameware "..tostring(getgenv().CurrentVersion),Content = "Selected: "..DropdownValue,Duration = 1.5});
    getgenv().SelectedDifficulty = DropdownValue;
end})
getgenv().SelectedDifficulty = "Easy";

FarmingTab:Button({Title = "Teleport to Boxing Machine",Desc = "Will teleport you to the current boxing machine.",Callback = function()
    Char.HumanoidRootPart.CFrame = CFrame.new(BoxingPath.Base.TP.Position);
end,})

FarmingTab:Toggle({Title = "Auto Use Boxing Machine",Desc = "This will use your money for boxing machine.",Value = false,Callback = function(Value)
    getgenv().AutoUseBoxingMachine = Value;

    if getgenv().AutoUseBoxingMachine == false then
        local PunchingBagProx = BoxingPath.Base.ProximityPrompt;
        PunchingBagProx:InputHoldEnd();
    end

    if getgenv().SelectedDifficulty == "Easy" then
        local EasyProx = BoxingPath.Base.Easy;
        EasyProx.HoldDuration = 0;EasyProx:InputHoldBegin();EasyProx:InputHoldEnd();
    elseif getgenv().SelectedDifficulty == "Medium" then
        local MediumProx = BoxingPath.Base.Medium;
        MediumProx.HoldDuration = 0;MediumProx:InputHoldBegin();MediumProx:InputHoldEnd();
    elseif getgenv().SelectedDifficulty == "Hard" then
        local HardProx = BoxingPath.Base.Hard;
        HardProx.HoldDuration = 0;HardProx:InputHoldBegin();HardProx:InputHoldEnd();
    elseif getgenv().SelectedDifficulty == "Extreme" then
        local ExtremeProx = BoxingPath.Base.Extreme;
        ExtremeProx.HoldDuration = 0;ExtremeProx:InputHoldBegin();ExtremeProx:InputHoldEnd();
    elseif getgenv().SelectedDifficulty == "Insanity" then
        local InsanityProx = BoxingPath.Base.Insanity;
        InsanityProx.HoldDuration = 0;InsanityProx:InputHoldBegin();InsanityProx:InputHoldEnd();
    elseif getgenv().SelectedDifficulty == "Godly" then
        local GodlyProx = BoxingPath.Base.Godly;
        GodlyProx.HoldDuration = 0;GodlyProx:InputHoldBegin();GodlyProx:InputHoldEnd();
    end

    while getgenv().AutoUseBoxingMachine == true do 
        pcall(function()
            local PunchingBagProx = BoxingPath.Base.ProximityPrompt;
            PunchingBagProx:InputHoldBegin();
        end)
        task.wait(1.5);
    end 
end,})

local CleaningTab = Window:Tab({
    Title = "Cleaning",
    Icon = "circle-dollar-sign",
})

local CleaningSectionTab = CleaningTab:Section({ 
    Title = "Cleaning Tab",
    TextSize = 22,
})

local CleaningSection = CleaningTab:Section({ 
    Title = "Cleaning Features",
    TextXAlignment = "Center"
})

CleaningTab:Toggle({Title = "Auto Complete Cleaning Quest",Desc = "This will Auto Clean for you to get money.",Value = false,Callback = function(Value)
    getgenv().AutoCleanQuest = Value;

    while getgenv().AutoCleanQuest == true do 
        pcall(function()
            if not BackPack:FindFirstChild("Mop") and not Char:FindFirstChild("Mop") then
                Char.HumanoidRootPart.CFrame = CFrame.new(-1540.6971435546875,199.77005004882812,272.5807189941406);
                local QuestProx = workspace[" "].ProximityPrompt;
                QuestProx.HoldDuration = 0;QuestProx:InputHoldBegin();QuestProx:InputHoldEnd();
            else
                for _,v in pairs(CleaningPath:GetChildren()) do
                    if v:IsA("BasePart") and v.Transparency ~= 1 then
                        Char.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0,3,0));
                        Char.Humanoid:EquipTool(LPlayer.Backpack:FindFirstChild("Mop"));
                        Char:FindFirstChild("Mop"):Activate();
                        break;
                    end
                end
            end
        end)
        task.wait(0.5);
    end 
end,})

Window:SelectTab(1);
