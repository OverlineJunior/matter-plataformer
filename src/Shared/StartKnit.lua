local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RunService = game:GetService('RunService')

local Knit = require(ReplicatedStorage.Packages.Knit)


local function StartKnit(container: Instance)
    local providerMatch = if RunService:IsServer() then 'Service$' else 'Controller$'

    for _, des in container:GetDescendants() do
        if des:IsA('ModuleScript') and des.Name:match(providerMatch) then
            require(des)
        end
    end

    Knit.Start()
end


return StartKnit
