fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Uggish Resources'
description 'Mission center by Uggish Resources'

shared_scripts {
    'config.lua',
    'strings.lua',
    '@ox_lib/init.lua'
}

client_script 'client/client.lua'
server_script 'server/server.lua'

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/style.css',
    'ui/script.js'
}