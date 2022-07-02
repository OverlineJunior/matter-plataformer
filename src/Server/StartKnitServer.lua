local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ServerStorage = game:GetService('ServerStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)


local function StartKnit()
    for _, des in ServerStorage.Server:GetDescendants() do
        if des:IsA('ModuleScript') and des.Name:match('Service$') then
            require(des)
        end
    end

    Knit.Start()
end


return StartKnit
