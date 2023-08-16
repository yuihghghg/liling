
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Credits"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")


local playerGui = game.Players.LocalPlayer.PlayerGui

local health = 100


local healthGui = Instance.new("ScreenGui")
healthGui.Name = "HealthGui"
healthGui.Parent = playerGui

local healthFrame = Instance.new("Frame")
healthFrame.Name = "HealthFrame"
healthFrame.Size = UDim2.new(0, 150, 0, 20)
healthFrame.Position = UDim2.new(1, -170, 0, 20)
healthFrame.BackgroundColor3 = Color3.fromRGB(59, 255, 255)
healthFrame.BorderSizePixel = 0
healthFrame.Parent = healthGui

local healthBar = Instance.new("Frame")
healthBar.Name = "HealthBar"
healthBar.Size = UDim2.new(1, 0, 1, 0)
healthBar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
healthBar.BorderSizePixel = 0
healthBar.Parent = healthFrame

local function updateHealthGUI()

   healthBar.Size = UDim2.new(health / 100, 0, 1, 0)
end

updateHealthGUI()

game.Players.LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(newHealth)
   health = newHealth
   updateHealthGUI()
end)

local playerGui = game.Players.LocalPlayer.PlayerGui

local fpsGui = Instance.new("ScreenGui")
fpsGui.Name = "FpsGui"
fpsGui.Parent = playerGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FpsLabel"
fpsLabel.Size = UDim2.new(0, 100, 0, 20)
fpsLabel.Position = UDim2.new(0, 20, 0, 20)
fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
fpsLabel.TextColor3 = Color3.new(150, 150, 203)
fpsLabel.Font = Enum.Font.SourceSans
fpsLabel.FontSize = Enum.FontSize.Size14
fpsLabel.Text = "FPS: "
fpsLabel.Parent = fpsGui

local lastUpdate = tick()

local fps = 0

local function updateFpsCounter()
    local deltaTime = tick() - lastUpdate
    lastUpdate = tick()
    
    fps = math.floor(1 / deltaTime)
    
    fpsLabel.Text = "帧数: " .. fps
end

game:GetService("RunService").RenderStepped:Connect(updateFpsCounter)


local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "Image"
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
ImageLabel.Size = UDim2.new(0.2, 0, 0.2, 0)
ImageLabel.Image = "rbxassetid://14454264094"
ImageLabel.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "Text"
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0)
TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextColor3 = Color3.new(136, 205, 232)
TextLabel.TextScaled = true
TextLabel.Text = "B.A-力量"
TextLabel.Parent = ScreenGui

local function animateCredits()
    local TweenService = game:GetService("TweenService")
    local imageTween = TweenService:Create(ImageLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.2, 0)})
    local textTween = TweenService:Create(TextLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.1, 0)})
    imageTween:Play()
    textTween:Play()
    
    wait(10)
    
    ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
    TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0)
    
    ScreenGui:Destroy()
end

animateCredits()

local creditText = "作者1541882711"
local creditDuration = 5

-- 定义可供选择的贴花id列表
local decalIds = {
    5479567228,
    5479565074,
    5479559610,
}

-- 从列表中选择一个随机贴花ID
local decalId = decalIds[math.random(#decalIds)]

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NotificationCreditsGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(1, -200, 1, -50)
Frame.Size = UDim2.new(0, 200, 0, 50)
Frame.Parent = ScreenGui

local Decal = Instance.new("Decal")
Decal.Texture = "rbxassetid://" .. decalId
Decal.Face = Enum.NormalId.Back
Decal.Parent = Frame

local TextLabel = Instance.new("TextLabel")
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = creditText
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
TextLabel.TextSize = 16
TextLabel.Position = UDim2.new(0, 10, 0, 10)
TextLabel.Size = UDim2.new(1, -20, 1, -20)
TextLabel.Parent = Frame

local function animateNotification()
    Frame:TweenPosition(UDim2.new(1, -200, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true)
    wait(creditDuration - 1)
    Frame:TweenPosition(UDim2.new(1, 0, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true)
    wait(0.5)
    ScreenGui:Destroy()
end

animateNotification()
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
Notification.Notify("️B.A-力量", "脚本正在加载（反挂机已开启）", "rbxassetid://14454264094", {
    Duration = 5,       
    Main = {
        Rounding = true,
    }
});
print("Anti Afk On")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/liling/main/HBUI.lua"))()

Notification.Notify("B.A-力量", "  脚本本加载成功√  ", "rbxassetid://14454264094", {
    Duration = 3,       
    Main = {
        Rounding = true,
    }
});
local Window = OrionLib:MakeWindow({Name = "B.A-力量", HidePremium = false, IntroEnabled = false, ConfigFolder = false})
local Tab = Window:MakeTab({
	Name = "√基础√",
	Icon = "rbxassetid://14454264094",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "反挂机",
  Callback = function()
    print("Anti Afk On")
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      wait(1)
      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
  end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddTextbox({
	Name = "移动速度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddTextbox({
	Name = "HP设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "飞行V3 byHB",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/gHNFtdZN"))()
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "甩飞别人",
	Callback = function()
     local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "HB-B.A",
    Text = "执行成功",
    Duration = 3, 
})
     loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "4k画质",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/nUrpHG3N"))();
end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "骂人无违规",
	Callback = function()
     loadstring(game:GetObjects("rbxassetid://1262435912")[1].Source)()
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "死亡笔记",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/siwangbook/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0(1).txt"))()
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "旋转大牛",
	Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
    end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "透视",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "吸取全部玩家",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/hQSBGsw2'))()
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "人物无敌",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "隐身(E)",
	Callback = function()
	 loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "一键获取无限R币",
	Callback = function()
     game.Players.LocalPlayer:Kick('开你🐴的挂，给老娘爬')
    end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "飞车",
	Callback = function()
     local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "HB脚本",
    Text = "B.A工作室",
    Duration = 3, 
})
     loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
  	end    
})

local Tab = Window:MakeTab({
    Name = "自动",
	Icon = "rbxassetid://14454264094",
	PremiumOnly = false
})
 
Tab:AddToggle({
	Name = "自动举重",
	Default = false,
	Callback = function(Value)
	    if Value then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/liling/main/%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87%E8%87%AA%E5%8A%A8%E4%B8%BE%E9%87%8D.txt"))()
    end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "自动俯卧撑",
	Callback = function()
	local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        local rs = game:GetService("RunService").RenderStepped
        while wait() do 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
        
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and v.Name == "Pushups" then
                v.Parent = game.Players.LocalPlayer.Character
                end
        end
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
        end
        end
        end
    end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "自动仰卧起坐",
	Callback = function()
	local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        local rs = game:GetService("RunService").RenderStepped
        while wait() do 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and v.Name == "Situps" then
                v.Parent = game.Players.LocalPlayer.Character
                end
                end
        end
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
         end
    end
    end
})

Tab:AddButton({
	Name = "击飞(无视力量和耐力)",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10123407012")[1].Source)()
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "收集宝石",
	Callback = function()
	jk = {}
for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do
    if v.Name ~= "Light Karma Chest" or v.Name ~= "Evil Karma Chest" then
        table.insert(jk, v.Name)
    end
end
for i = 1, #jk do
    wait(2)
    game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i])
end
    end
})

local Tab = Window:MakeTab({
    Name = "卡宠",
    Icon = "rbxassetid://14454264094",
    PremiumOnly = false
})
 
Tab:AddToggle({
	Name = "卡宠1(不推荐)",
	Callback = function()
	end
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddToggle({
	Name = "卡宠2",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/liling/main/%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87%E5%8D%A1%E5%AE%A0.txt"))()
	end
})

local Tab = Window:MakeTab({
    Name = "传送",
	Icon = "rbxassetid://14454264094",
	PremiumOnly = false
})
 
Tab:AddButton({
	Name = "传送到出生点",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})
 
Tab:AddButton({
	Name = "传送到冰霜健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})
 
Tab:AddButton({
	Name = "传送到神话健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "传送到永恒健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "传送到传说健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "传送到肌肉之王健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "传送到安全岛",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
  	end    
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

local Section = Tab:AddSection({
	Name = "滑动区域"
})

Tab:AddButton({
	Name = "传送到幸运抽奖区域",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)
  	end    
})


OrionLib:Init()