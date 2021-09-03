local function init()
    require 'maxheyer.vim'.init()
    require 'maxheyer.packer'.init()
end

return {
    init = init,
}
