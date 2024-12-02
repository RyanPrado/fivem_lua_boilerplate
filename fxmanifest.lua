fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--- #TODO: add resource name
name         '<RESOURCENAME>'
--- #TODO: add resource version
version      '0.0.0'
--- #TODO: add resource author
author       '<AUTHOR>'
--- #TODO: add resource repository
repository   ''

shared_script '@ox_lib/init.lua'
server_script 'init.lua'
client_script 'init.lua'

files {
  'static/locales/*.json',
  'static/settings/*.json',
  'static/bridge/**/*.lua',
  'src/modules/**/client.lua',
  'src/modules/**/client/*.lua',
  'src/modules/**/shared.lua',
  'src/modules/**/shared/*.lua',
}

escrow_ignore {
  'static/**',
  'web/**',
}