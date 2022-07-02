local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)


local function StartKnit()
    for _, des in ReplicatedStorage.Client:GetDescendants() do
        if des:IsA('ModuleScript') and des.Name:match('Controller$') then
            require(des)
        end
    end

    Knit.Start()
end


return StartKnit
