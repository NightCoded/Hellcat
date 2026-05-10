-- =====================================================================
-- PROJECT: SADBOY XD - SCRIPT SCANNER V15 (ULTIMATE NATIVE LUA.EXPERT)
-- STATUS: FULL CODE - NO TRUNCATION - MOBILE FRIENDLY
-- =====================================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- Mengambil fungsi HTTP executor dengan aman
local httpRequest = request or http_request or (syn and syn.request)

-- =====================================================================
-- 0. SMART PARENTING & CLEANUP
-- =====================================================================
local TargetParent = LocalPlayer:WaitForChild("PlayerGui")
pcall(function() if CoreGui then TargetParent = CoreGui end end)

if TargetParent:FindFirstChild("SadBoy_Scanner_V15") then
    TargetParent["SadBoy_Scanner_V15"]:Destroy()
end

-- =====================================================================
-- 1. MODERN UI CONSTRUCTION (DARK THEME & TABS)
-- =====================================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SadBoy_Scanner_V15"
ScreenGui.DisplayOrder = 999999999 
ScreenGui.Parent = TargetParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 290)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -145)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(40, 40, 45)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local Topbar = Instance.new("Frame")
Topbar.Name = "Topbar"
Topbar.Size = UDim2.new(1, 0, 0, 35)
Topbar.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
Topbar.BorderSizePixel = 0
Topbar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = Topbar

local TopBlocker = Instance.new("Frame")
TopBlocker.Size = UDim2.new(1, 0, 0, 10)
TopBlocker.Position = UDim2.new(0, 0, 1, -10)
TopBlocker.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
TopBlocker.BorderSizePixel = 0
TopBlocker.Parent = Topbar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SADBOY XD | SCANNER V15"
Title.TextColor3 = Color3.fromRGB(200, 200, 205)
Title.TextSize = 12
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Topbar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -35, 0, 0)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 18
MinBtn.Parent = Topbar

local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, 0, 0, 30)
TabContainer.Position = UDim2.new(0, 0, 0, 35)
TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabScriptBtn = Instance.new("TextButton")
TabScriptBtn.Size = UDim2.new(0.5, 0, 1, 0)
TabScriptBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
TabScriptBtn.BorderSizePixel = 0
TabScriptBtn.Text = "LOCAL SCRIPTS"
TabScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabScriptBtn.Font = Enum.Font.GothamBold
TabScriptBtn.TextSize = 10
TabScriptBtn.Parent = TabContainer

local TabModuleBtn = Instance.new("TextButton")
TabModuleBtn.Size = UDim2.new(0.5, 0, 1, 0)
TabModuleBtn.Position = UDim2.new(0.5, 0, 0, 0)
TabModuleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
TabModuleBtn.BorderSizePixel = 0
TabModuleBtn.Text = "MODULE SCRIPTS"
TabModuleBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
TabModuleBtn.Font = Enum.Font.GothamBold
TabModuleBtn.TextSize = 10
TabModuleBtn.Parent = TabContainer

local TabIndicator = Instance.new("Frame")
TabIndicator.Size = UDim2.new(0.5, 0, 0, 2)
TabIndicator.Position = UDim2.new(0, 0, 1, -2)
TabIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabIndicator.BorderSizePixel = 0
TabIndicator.Parent = TabContainer

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, 0, 1, -65)
Content.Position = UDim2.new(0, 0, 0, 65)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local ScanBtn = Instance.new("TextButton")
ScanBtn.Size = UDim2.new(1, -24, 0, 32)
ScanBtn.Position = UDim2.new(0, 12, 0, 10)
ScanBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ScanBtn.Text = "SCAN NEW SCRIPTS"
ScanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanBtn.Font = Enum.Font.GothamBold
ScanBtn.TextSize = 11
ScanBtn.Parent = Content

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = ScanBtn

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -24, 1, -60)
Scroll.Position = UDim2.new(0, 12, 0, 50)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 2
Scroll.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 65)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.Parent = Content

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 5)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Parent = Scroll

-- =====================================================================
-- 2. LOGIKA TAB & FILTERING
-- =====================================================================

local currentTab = "LocalScript"

local function updateCanvas()
    local count = 0
    for _, item in pairs(Scroll:GetChildren()) do
        if item:IsA("TextButton") and item.Visible then count = count + 1 end
    end
    Scroll.CanvasSize = UDim2.new(0, 0, 0, count * 37)
end

local function switchTab(tabType)
    currentTab = tabType
    if tabType == "LocalScript" then
        TabScriptBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        TabScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabModuleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
        TabModuleBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
        ScanBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        TabIndicator:TweenPosition(UDim2.new(0, 0, 1, -2), "Out", "Quad", 0.2, true)
    else
        TabModuleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        TabModuleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabScriptBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
        TabScriptBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
        ScanBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        TabIndicator:TweenPosition(UDim2.new(0.5, 0, 1, -2), "Out", "Quad", 0.2, true)
    end
    
    for _, item in pairs(Scroll:GetChildren()) do
        if item:IsA("TextButton") then
            local classVal = item:FindFirstChild("ObjClass")
            if classVal then item.Visible = (classVal.Value == tabType) end
        end
    end
    updateCanvas()
end

TabScriptBtn.MouseButton1Click:Connect(function() switchTab("LocalScript") end)
TabModuleBtn.MouseButton1Click:Connect(function() switchTab("ModuleScript") end)

-- =====================================================================
-- 3. LOGIKA NATIVE LUA.EXPERT (DIREPLIKA LANGSUNG KE SCRIPT KITA)
-- =====================================================================

local lastApiCall = 0

local function encodeBase64(data)
    if base64_encode then return base64_encode(data) end
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r,byte = '',x:byte()
        for i=8,1,-1 do r = r .. (byte % 2^i - byte % 2^(i-1) > 0 and '1' or '0') end
        return r
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if #x < 6 then return '' end
        local c = 0
        for i=1,6 do c = c + (x:sub(i,i) == '1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data % 3 + 1])
end

local function nativeExpertDecompile(scr)
    if not getscriptbytecode then return "-- [ERROR] Executor ini tidak mendukung getscriptbytecode." end
    if not httpRequest then return "-- [ERROR] Executor tidak mendukung HTTP Request." end

    local ok, bytecode = pcall(getscriptbytecode, scr)
    if not ok then
        return "-- [API ERROR] Gagal membaca bytecode.\n-- " .. tostring(bytecode)
    end

    -- Meniru Rate Limiter bawaan lua.expert
    local elapsed = os.clock() - lastApiCall
    if elapsed < 0.12 then
        task.wait(0.12 - elapsed)
    end

    -- Menyusun payload sesuai permintaan API aslinya
    local reqData = {
        Url = "https://api.lua.expert/decompile",
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json"
        },
        Body = HttpService:JSONEncode({
            script = encodeBase64(bytecode)
        })
    }

    local successReq, res = pcall(function() return httpRequest(reqData) end)
    lastApiCall = os.clock()

    if not successReq or not res or res.StatusCode ~= 200 then
        return "-- [API ERROR] Request ditolak oleh server lua.expert.\n-- RAW: " .. tostring(res and res.Body or "No Response")
    end

    return res.Body
end

-- =====================================================================
-- 4. LOGIKA UTILS (FILTER, PATH, SERIALIZER)
-- =====================================================================

local function isOtherPlayerChar(obj)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and obj:IsDescendantOf(p.Character) then return true end
    end
    return false
end

local function getPath(obj)
    local p = obj.Name
    local parent = obj.Parent
    while parent and parent ~= game do
        local parentName = parent.Name
        if parentName:match("%s") or parentName:match("%W") then p = '["' .. parentName .. '"].' .. p
        else p = parentName .. "." .. p end
        parent = parent.Parent
    end
    return "game." .. p
end

local function serializeTable(val, indent)
    indent = indent or ""
    if type(val) == "table" then
        local s = "{\n"
        for k, v in pairs(val) do
            local ks = type(k) == "string" and '["' .. k .. '"]' or "[" .. tostring(k) .. "]"
            s = s .. indent .. "    " .. ks .. " = " .. serializeTable(v, indent .. "    ") .. ",\n"
        end
        return s .. indent .. "}"
    elseif type(val) == "string" then return '"' .. val .. '"'
    elseif type(val) == "function" then return "function() end"
    elseif type(val) == "userdata" then return "userdata ("..typeof(val)..")"
    else return tostring(val) end
end

-- =====================================================================
-- 5. ITEM CREATION & EVENT LISTENER (SAFE THREADING)
-- =====================================================================

local function createItem(obj)
    local Item = Instance.new("TextButton")
    Item.Size = UDim2.new(1, 0, 0, 32)
    Item.BackgroundColor3 = Color3.fromRGB(22, 22, 25)
    Item.BorderSizePixel = 0
    Item.Text = ""
    Item.AutoButtonColor = true
    
    local classVal = Instance.new("StringValue")
    classVal.Name = "ObjClass"
    classVal.Value = obj.ClassName
    classVal.Parent = Item
    
    Item.Visible = (obj.ClassName == currentTab)
    Item.Parent = Scroll

    local IC = Instance.new("UICorner")
    IC.CornerRadius = UDim.new(0, 4)
    IC.Parent = Item

    local Icon = Instance.new("TextLabel")
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Position = UDim2.new(0, 6, 0.5, -12)
    Icon.BackgroundColor3 = obj:IsA("ModuleScript") and Color3.fromRGB(0, 180, 100) or Color3.fromRGB(0, 120, 255)
    Icon.Text = obj:IsA("ModuleScript") and "M" or "S"
    Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    Icon.Font = Enum.Font.GothamBold
    Icon.TextSize = 10
    Icon.Parent = Item

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(1, 0)
    IconCorner.Parent = Icon

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -40, 1, 0)
    NameLabel.Position = UDim2.new(0, 36, 0, 0)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = obj.Name
    NameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    NameLabel.TextSize = 11
    NameLabel.Font = Enum.Font.Gotham
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = Item

    local lastClick = 0
    
    Item.MouseButton1Click:Connect(function()
        local t = tick()
        if t - lastClick < 0.3 then
            ScanBtn.Text = "DECOMPILING VIA API..."
            
            -- Kita bungkus di task.spawn KARENA httpRequest memiliki yield/tunggu internet.
            -- Karena kita menggunakan HTTP request asli milik kita sendiri (bukan native decompile), C-yield aman!
            task.spawn(function()
                local source = ""
                local header = "-- Path: " .. getPath(obj) .. "\n\n"
                
                -- PANGGIL FUNGSI NATIVE EXPERT BUATAN KITA SENDIRI
                local res = nativeExpertDecompile(obj)
                
                -- Evaluasi Hasil
                if type(res) == "string" and res ~= "" and not string.match(res, "%[API ERROR%]") then
                    source = header .. res
                else
                    -- Jika API mentok (karena tidak ada bytecode), lari ke Smart Bypass jika Module
                    if obj:IsA("ModuleScript") then
                        local sReq, data = pcall(function() return require(obj) end)
                        if sReq and data then
                            source = header .. "-- [AUTO BYPASS EXTRACT]\nreturn " .. serializeTable(data)
                        else
                            source = header .. "-- [ERROR] Decompile & Require failed.\n" .. tostring(res)
                        end
                    else
                        source = header .. res
                    end
                end
                
                if setclipboard then
                    setclipboard(source)
                    ScanBtn.Text = "COPIED TO CLIPBOARD!"
                end
                task.delay(1.5, function() ScanBtn.Text = "SCAN NEW SCRIPTS" end)
            end)
        else
            Item.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            task.delay(0.2, function() Item.BackgroundColor3 = Color3.fromRGB(22, 22, 25) end)
        end
        lastClick = t
    end)
end

-- =====================================================================
-- 6. SCAN, DRAG, & MINIMIZE LOGIC
-- =====================================================================

ScanBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(Scroll:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    ScanBtn.Text = "SCANNING ENGINE..."
    
    task.spawn(function()
        local totalScanned = 0
        local areas = {game.Workspace, game.ReplicatedStorage, LocalPlayer}
        
        for _, area in pairs(areas) do
            for _, obj in pairs(area:GetDescendants()) do
                if (obj:IsA("LocalScript") or obj:IsA("ModuleScript")) and not isOtherPlayerChar(obj) then
                    totalScanned = totalScanned + 1
                    createItem(obj)
                end
            end
        end
        
        updateCanvas()
        ScanBtn.Text = "FOUND " .. totalScanned .. " FILES"
        task.wait(1.5)
        ScanBtn.Text = "SCAN NEW SCRIPTS"
    end)
end)

local d, di, ds, sp
Topbar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        d = true ds = i.Position sp = MainFrame.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then d = false end end)
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local delta = i.Position - ds
        MainFrame.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y)
    end
end)

local isMin = false
MinBtn.MouseButton1Click:Connect(function()
    isMin = not isMin
    TabContainer.Visible = not isMin
    Content.Visible = not isMin
    MainFrame:TweenSize(isMin and UDim2.new(0, 320, 0, 35) or UDim2.new(0, 320, 0, 290), "Out", "Quad", 0.2, true)
    MinBtn.Text = isMin and "+" or "−"
end)

RunService.Heartbeat:Connect(function() end)

