fx_version 'cerulean'
game 'gta5'

name 'hm-handling'
description 'HM Handling Editor — MopsScripts'
version '1.1.0' --NUI Big Upadate
author 'MopsScripts'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/config_nui.lua',
}

client_scripts {
    'client/main.lua',
    'client/nui.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/database.lua',
    'server/main.lua',
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/app.js',
}

lua54 'yes'

escrow_ignore {
    'shared/config.lua',
    'shared/config_nui.lua',
    'install.sql',
}
