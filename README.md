# VSB Libraries

### Additional libraries for Void Script Builder

***
`legal_logging.lua`
Makes it easier to log chat safely.
***

Example for `legal_logging`:
```lua
local Module = 'legal_logging.lua'
local URL = 'https://raw.githubusercontent.com/raymonable/vsb-libraries/main/lib/'..Module
local Success, Module = pcall(function()
  return loadstring(URL)()
end)
if Success then
  local Logger = Module('SERVER')
  Logger:Connect(function(Player, Message)
    print(Player.Name, Message)
  end)
end
```
