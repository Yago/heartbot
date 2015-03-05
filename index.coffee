fs = require 'fs'
yaml = require 'js-yaml'
path = require 'path'
heartbot = require path.join __dirname, 'tellbot', 'index.coffee'

hubotPath = module.parent.filename
hubotPath = path.dirname hubotPath for [1..4]
configPath = path.join hubotPath, 'tellbot.config.yml'

try
  config = yaml.safeLoad fs.readFileSync configPath, 'utf8'
catch err
  console.error "An error occurred while trying to load Tellbot's config."
  console.error err
  process.exit()

heartbot = heartbot.bind null, config

module.exports = heartbot
