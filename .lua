local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Beta Turtle Hub UI")
local user = game:GetService("Players").LocalPlayer

local Tab1 = Window_1:NewSection("Main")
local Tab2 = Window_1:NewSection("Bullet settings")

local function playerInst(func)
  for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    func(i,v)
  end
end

local function shoot(position)
    game:GetService("Players")["LocalPlayer"]["Character"]["Shuriken"]["HitEvent"]:FireServer(position)
end

local function detectWallAndShoot()
    local ray = Ray.new(user.Character.Head.Position,user.Character.Head.CFrame.LookVector * 500)
    local hitPart, hitPosition = game.Workspace:FindPartOnRay(ray,user.Character,false,true)
    if hitPart and hitPart:IsA("BasePart") or hitPart:IsA("Part") then
        shoot(hitPosition)
    end
end

Tab1:CreateToggle("Auto farm ninjutsu",function(value)
        _G.ninj = value
    while wait() do
      if _G.ninj == false then break end
      game:GetService("ReplicatedStorage")["RemoteEvent"]["AddPowerEvent"]:FireServer("FromTraining",10)
    end
end)

Tab2:CreateToggle("Wallbang",function(value)
    _G.wallb = value
end)

Tab1:CreateToggle("Auto spam shuriken",function(value)
    _G.sshu = value
    while wait() do
      if _G.sshu == false then break end
      playerInst(function(i,v)
          if _G.wallb == false then
            shoot(v.Position)
          end
      end)
  end
end)
