fx_version 'cerulean'
game 'gta5'

author 'NEİZFİX'
description 'QB Core Meslekli Depo Script'
version '1.0.0'

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    '@qb-core/import.lua',
    'server.lua',
    'config.lua'
}

shared_script {
    'config.lua'
}
