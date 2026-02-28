fx_version 'cerulean'
game 'gta5'

name        'hm-handling'
description 'HM Handling Editor — MopsScripts'
version     '1.0.0'
author      'MopsScripts'

shared_script '@ox_lib/init.lua'

-- Config: kein lua54 → frei editierbar für Kunden
shared_scripts {
    'config/config.lua',
    'config/config_nui.lua',
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
}
