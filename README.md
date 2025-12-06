# BasicPlayerInfo

A lightweight client-side module that returns a table containing useful information about the local player, device, policy data, and session environment.

[<img src="https://github.com/user-attachments/assets/880e1033-0ffd-4769-8c4c-29ed2a9f709d" width="420" alt="MainTuff_Icon">](https://github.com/user-attachments/assets/880e1033-0ffd-4769-8c4c-29ed2a9f709d)

## Installation

Place the module in **ReplicatedStorage** (or any client-accessible container) and require it from a LocalScript:

```Luau
local PlayerInfo = require(path.to.BasicPlayerInfo)
```

## Usage

```Lua
local info = require(path.to.BasicPlayerInfo)

print(info.Device)
print(info.Country)
print(info:GetPing())
```

## Returned Properties&Methods

| Property     | Description |
|--------------|-------------|
| `UserId`     | The local player's UserId. |
| `AccountAge` | Account age in days. |
| `Character`  | The player's character (waits if not loaded). |
| `Player`     | Reference to `Players.LocalPlayer`. |
| `Device`     | Detected device type (`PC`, `Mobile`, `Console`, `VR`, etc.). |
| `Name`       | Player's display name. |
| `UserName`   | Player's username. |
| `Mouse`      | Player’s mouse object. |
| `GetPing()`       | Network ping in milliseconds. |
| `Policy`     | Policy table from `PolicyService`. |
| `Country`    | Country/region code from `LocalizationService`. |
| `Verified`   | Whether the player has the verified badge. |
| `TPData`     | Teleport data from `TeleportService`. |
| `AppVersion` | Value returned by `version()` that shows the current player AppVersion (e.g.. 1.700.671) |
> also calling the module ``PlayerData()`` itself would return ``game:GetService("Players")`` and tostringing PlayerData like ``print`` will return ``LocalPlayer.Name``
## Examples

```Luau
local PlayerData = require(game:GetService("ReplicatedStorage").PlayerData)

if PlayerData.Device == "Mobile" then
    print("You're playing on Mobile! Adjusting UI...")
elseif PlayerData.Device == "Pc" then
    print("PC detected — enabling keyboard/mouse UI.")
elseif PlayerData.Device == "Console" then
    print("Console detected — enabling controller UI.")
elseif PlayerData.Device == "VR" then
    print("VR detected — enabling VR features.")
else
    warn("Unknown device type:", PlayerData.Device) -- there is also touchlaptop/Chrome support [PlayerData.Device == "TouchLaptop"] (a friend forced me to add support to them bc i didn't know chrome player's exist, and if your one i still think you aint real)
end
```

```Luau
local PlayerData = require(game:GetService("ReplicatedStorage"):WaitForChild("PlayerData"))

print("=== Player Information ===")
print("Name:", PlayerData.UserName)
print("Display Name:", PlayerData.Name)
print("UserId:", PlayerData.UserId)
print("Account Age:", PlayerData.AccountAge, "days")
print("Country:", PlayerData.Country)
print("Ping (ms):", PlayerData:GetPing())

print("=== Device Info ===")
print("Device Type:", PlayerData.Device)
print("App Version:", PlayerData.AppVersion)
```

## Notes
- Must be required **on the client**.
- All service calls are wrapped in `pcall` for safety, if a function failed most of them will return ``"Unkown"``.

> [!WARNING]
> note on security:
> for stuff like ``Verified`` or ``TPData`` please do NOT attach a Remote(Events/Functions/Unreliable)
> (for example creating a system that gives the player a special role for bieng Verified and so on) since exploiters can and will spoof - tamper or modify it
> that goes the same for others so check sensitive stuff **ServerSide**

# Misc...
[![License: ](https://img.shields.io/badge/License%3A-MIT-green?style=plastic)](https://github.com/not-mentally-stable/BPI-Player-Basic-Information/blob/main/LICENSE)

[![Scripting Language: LUAU](https://img.shields.io/badge/Scripting%20Language%3A-LUAU-blue?style=plastic)](https://github.com/luau-lang/luau)
