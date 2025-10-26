local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()



local MainWindow = Rayfield:CreateWindow({
   Name = "Anomic GhostWare V1 ",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Anomic Ghostware V1 ",
   LoadingSubtitle = "by Cadric, Ashton",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "GhostWare"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Anomic GhostWare  ",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Cadric Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"actnurse"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = MainWindow:CreateTab("Player", "user-round")



local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 250},
   Increment = 10,
   Suffix = "WalkSpeed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(v)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
  end,
})



local Slider = MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 500},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(v)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
  end,
})



-- Make sure these are defined outside the callback so they persist
local NoclipConnection = nil
local NoclipEnabled = false

local Toggle = MainTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(enabled)
        local player = game.Players.LocalPlayer
        local runService = game:GetService("RunService")

        NoclipEnabled = enabled

        if enabled then
            -- Turn ON noclip
            NoclipConnection = runService.Stepped:Connect(function()
                local char = player.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)

        else
            -- Turn OFF noclip
            if NoclipConnection then
                NoclipConnection:Disconnect()
                NoclipConnection = nil
            end

            -- Restore collisions for all parts
            local char = player.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end,
})



local MainTab = MainWindow:CreateTab("Combat", "swords")
--COMBAT TAB--

local MainTab = MainWindow:CreateTab("ESP", "eye")

--ESP TAB--
