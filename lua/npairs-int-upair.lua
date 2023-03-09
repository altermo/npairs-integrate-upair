local M={}
M.default_config={
    map='n',
    cmap='u',
    bs='n',
    cr='n',
    space='u',
    c_h='',
    c_w='',
    fastwarp='<A-e>',
    rfastwarp='<A-E>',
    fastwrap='<A-]>',
    npairs_conf={},
    upair_conf={},
}
function M.setup(config)
    M.config=vim.tbl_deep_extend('force',M.default_config,config or {})
    M.init_plugins()
end
function M.init_plugins()
    M.init_upari()
    M.init_nparis()
end
function M.init_upari()
    local status,upair=pcall(require,'ultimate-autopair')
    if not status then
        error('ultimate-autopair not found')
    end
    local config={
        nomap=(M.config.map~='u'),
        cmap=(M.config.cmap=='u'),
        bs={nomap=(M.config.bs~='u'),cmap=(M.config.cmap=='u')},
        cr={enable=(M.config.cr=='u')},
        space={enable=(M.config.space=='u')},
        fastwarp={
            enable=(M.config.fastwarp~=''),
            map=(M.config.fastwarp),
            rmap=(M.config.rfastwarp),
            cmap=(M.config.fastwarp),
            rcmap=(M.config.rfastwarp),
        },
        fastend={enable=false},
    }
    upair.setup(vim.tbl_deep_extend('force',config,M.config.upair_conf))
end
function M.init_nparis()
    local status,npairs=pcall(require,'nvim-autopairs')
    if not status then
        error('ultimate-autopair not found')
    end
    local config={
        fast_wrap=(M.config.fastwrap~='' and {map=M.config.fastwrap}),
        map_cr=(M.config.cr=='n'),
        map_bs=(M.config.bs=='n'),
        map_c_h=(M.config.c_h=='n'),
        map_c_w=(M.config.c_w=='n'),
    }
    npairs.setup(vim.tbl_deep_extend('force',config,M.config.npairs_conf))
    if M.config.map~='n' then
        for _,i in ipairs(npairs.config.rules) do
            i.key_map=nil
        end
    end
end
return M
