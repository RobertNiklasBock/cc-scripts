local utils = {}

function utils.optional(arg, default)
    if not arg then
        return default
    else
        return arg
    end
end

return utils