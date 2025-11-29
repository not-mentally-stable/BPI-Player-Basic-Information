# BasicPlayerInfo

A lightweight client-side module that returns a table containing useful information about the local player, device, policy data, and session environment.
![Picsart_25-11-29_14-44-33-721](https://github.com/user-attachments/assets/4fccf764-3b2e-4e49-b20f-f710558cc8de)

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
print(info.Ping)
```

## Returned Properties

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
| `Ping`       | Network ping in milliseconds. |
| `Policy`     | Policy table from `PolicyService`. |
| `Country`    | Country/region code from `LocalizationService`. |
| `Verified`   | Whether the player has the verified badge. |
| `TPData`     | Teleport data from `TeleportService`. |
| `AppVersion` | Value returned by `version()` that shows the current player AppVersion (e.g.. 1.700.671) |

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
