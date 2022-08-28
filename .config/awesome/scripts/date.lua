local os = require("os")

local function notifyDate()
   os.execute([[notify-send -t 3000 "$(date)"]])
end

return notifyDate
