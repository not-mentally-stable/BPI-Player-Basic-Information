-- dont use this yet (testing)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local PolicyService = game:GetService("PolicyService")
local LocalizationService = game:GetService("LocalizationService")
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	error("BasicPlayerInfo can only be required on the client (duh..)")
end

local PlayerData = {}
PlayerData.__index = PlayerData

local function detectDevice() --// feel free to modify this
	if UserInputService.VREnabled then
		return "VR"
	elseif GuiService:IsTenFootInterface() then
		return "Console"
	elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled then
		return "TouchLaptop"
	elseif UserInputService.TouchEnabled then
		return "Mobile"
	elseif UserInputService.KeyboardEnabled then
		return "Pc"
	end
	return "Unknown"
end

local function safePolicy()
	local ok, result = pcall(function()
		return PolicyService:GetPolicyInfoForPlayerAsync(LocalPlayer)
	end)
	return ok and result or {}
end

local function safeCountry()
	local ok, result = pcall(function()
		return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
	end)
	return ok and result or "Unknown"
end

local function getPing()
	return math.floor(LocalPlayer:GetNetworkPing() * 1000)
end

local function GetTpData()
	local ok, result = pcall(function()
		return TeleportService:GetLocalPlayerTeleportData(LocalPlayer)
	end)
	return ok and result or "Unknown"
end 

function PlayerData.new()
	local self = {}
	self.UserId = LocalPlayer.UserId
	self.AccountAge = LocalPlayer.AccountAge
	self.Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	self.Player = LocalPlayer
	self.Device = detectDevice()
	self.Name = LocalPlayer.DisplayName
	self.UserName = LocalPlayer.Name
	self.Mouse = LocalPlayer:GetMouse()
	self.Ping = getPing()
	self.Policy = safePolicy()
	self.Country = safeCountry()
	self.Verified = LocalPlayer.HasVerifiedBadge
	self.TPData = GetTpData()
	self.AppVersion = version()
	return setmetatable(self, PlayerData)
end

return PlayerData.new()
