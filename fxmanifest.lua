fx_version 'cerulean'
game 'gta5'

name 'hm_handling'
description 'HM Handling Editor — MopsScripts'
version '1.1.1' -- fxmanifest
author 'MopsScripts'

lua54 'no'
shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/config_nui.lua',
}

lua54 'yes'
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
