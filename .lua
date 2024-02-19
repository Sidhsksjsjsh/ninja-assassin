local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Beta Turtle Hub UI")


local Tab1 = Window_1:NewSection("Main")
local Tab2 = Window_1:NewSection("Bullet settings")

local function playerInst(func)
  for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    func(i,v)
  end
end

Tab1:CreateToggle("Auto farm ninjutsu",function(value)
        _G.ninj = value
    while wait() do
      if _G.ninj == false then break end
      game:GetService("ReplicatedStorage")["RemoteEvent"]["AddPowerEvent"]:FireServer("FromTraining",10)
    end
end)

Tab1:CreateToggle("Auto spam shuriken",function(value)
    _G.sshu = value
    while wait() do
      if _G.sshu == false then break end
      playerInst(function(i,v)
        game:GetService("Players")["LocalPlayer"]["Character"]["Shuriken"]["HitEvent"]:FireServer(v.Position)
      end)
  end
end)
