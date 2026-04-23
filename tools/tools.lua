local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera

local Flags = {
    Picking = false,
    Target = nil,
    IsDragging = false,
    OldCanCollide = true,
    Distance = 25 -- Jarak lebih jauh agar tidak kena tubuh
}

-- 1. SETUP UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SadBoyXD_V2_2"
ScreenGui.Parent = lp:WaitForChild("PlayerGui")
ScreenGui.DisplayOrder = 999999
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 180)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Visible = false
MainFrame.ZIndex = 10
Instance.new("UICorner", MainFrame)

local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 110, 0, 45)
ToggleBtn.Position = UDim2.new(0, 10, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
ToggleBtn.Text = "PICK: OFF"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.ZIndex = 100
ToggleBtn.Draggable = true
Instance.new("UICorner", ToggleBtn)

-- Fungsi Aksi
local function CreateAction(name, pos, color, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = pos
    btn.Text = name
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 20
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

-- Tombol DRAG dengan Fix Terperosok
CreateAction("DRAG / PLACE", UDim2.new(0.05, 0, 0.1, 0), Color3.fromRGB(0, 150, 0), function()
    if Flags.Target then
        Flags.IsDragging = not Flags.IsDragging
        
        if Flags.IsDragging then
            -- Saat diambil
            Flags.OldCanCollide = Flags.Target.CanCollide
            Flags.Target.CanCollide = false
            Flags.Target.Anchored = true 
            print("SadBoy XD: Part Berhasil Diambil")
        else
            -- Saat dilepas (PLACE)
            Flags.Target.CanCollide = true -- Paksa aktif agar tidak tembus tanah
            Flags.Target.Anchored = true -- Tetap ANCHORED agar tidak jatuh ke bawah tanah
            print("SadBoy XD: Part Berhasil Diletakkan (Locked)")
        end
    end
end)

CreateAction("DELETE", UDim2.new(0.05, 0, 0.4, 0), Color3.fromRGB(180, 0, 0), function()
    if Flags.Target then Flags.Target:Destroy() end
    Flags.Target = nil
    MainFrame.Visible = false
    Flags.IsDragging = false
end)

CreateAction("CLOSE / CANCEL", UDim2.new(0.05, 0, 0.7, 0), Color3.fromRGB(60, 60, 60), function()
    if Flags.Target then
        if Flags.Target:FindFirstChild("XD_Select") then Flags.Target.XD_Select:Destroy() end
        Flags.Target.CanCollide = Flags.OldCanCollide
    end
    Flags.Target = nil
    Flags.IsDragging = false
    MainFrame.Visible = false
end)

-- LOGIKA SCAN OBJEK
local function ScanPart(pos)
    local unitRay = camera:ScreenPointToRay(pos.X, pos.Y)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {lp.Character, ScreenGui}
    
    local result = workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000, raycastParams)
    return result and result.Instance or nil
end

UIS.InputBegan:Connect(function(input)
    if not Flags.Picking or Flags.Target then return end
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        local part = ScanPart(input.Position)
        if part and part:IsA("BasePart") then
            Flags.Target = part
            MainFrame.Visible = true
            local highlight = Instance.new("SelectionBox", part)
            highlight.Name = "XD_Select"
            highlight.Adornee = part
            highlight.Color3 = Color3.new(0, 1, 0)
        end
    end
end)

-- LOGIKA DRAGGING (Heartbeat)
RunService.Heartbeat:Connect(function()
    if Flags.IsDragging and Flags.Target then
        -- Gunakan jarak 25 stud (Flags.Distance) agar jauh dari tubuh
        Flags.Target.CFrame = camera.CFrame * CFrame.new(0, 0, -Flags.Distance)
    end
end)

-- TOGGLE PICK MODE
ToggleBtn.MouseButton1Click:Connect(function()
    Flags.Picking = not Flags.Picking
    ToggleBtn.Text = Flags.Picking and "PICK: ON" or "PICK: OFF"
    ToggleBtn.BackgroundColor3 = Flags.Picking and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(200, 0, 0)
    if not Flags.Picking then
        MainFrame.Visible = false
        if Flags.Target then
            Flags.Target.CanCollide = Flags.OldCanCollide
            if Flags.Target:FindFirstChild("XD_Select") then Flags.Target.XD_Select:Destroy() end
        end
        Flags.Target = nil
        Flags.IsDragging = false
    end
end)

print("SadBoy XD: Editor V2.2 (Solid Place) Loaded!")
