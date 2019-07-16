{ spawn, exec } = require 'child_process'
path = require 'path'
fs = require 'fs'
glob = require 'glob'
log = console.log


module.exports = (task) ->
  
    
  task 'build', ->
    extensions = [ 'js', 'html', 'png', 'jpg', 'gif', 'css', 'md' ]
    names = extensions.map (ext) ->
      "-iname \\*.#{ext}"
    find = "find . \\( #{names.join(' -o ')} \\)"
    run "rm -rf lib && ./node_modules/.bin/coffee -o lib -c src && cd src && #{find} -exec rsync -R {} ../lib \\;"


  task 'lint', ->
    coffeeLintPath = path.join(__dirname, '..', 'coffeelint.json')
    run "coffeelint -f #{coffeeLintPath} src/*"


  task 'pdf', ->
    return log('PDF generation no longer supported')


  option '-p', '--prefix', 'prefix for test files (prefix-string or dir/)'
  task 'test', (options) ->
    prefix = options.path or ''
    pattern = "spec/{,**/}#{prefix}*spec.coffee"
    log("Running tests at #{pattern}...")
    run "NODE_ENV=test TZ=GMT mocha --require coffee-script/register --reporter spec --colors --recursive '#{pattern}'"


run = (args...) ->
  for a in args
    switch typeof a
      when 'string' then command = a
      when 'object'
        if a instanceof Array then params = a
        else options = a
      when 'function' then callback = a

  options ?= {}
  options.stdio ?= 'inherit'

  binDirNpm2 = path.join(__dirname, '..', 'node_modules', '.bin')
  binDirNpm3 = path.join('.', 'node_modules', '.bin')

  command = "PATH=$PATH:#{binDirNpm2}:#{binDirNpm3}; #{command}"
  command += " #{params.join} " if params?
  cmd = spawn '/bin/sh', ['-c', command], options

  process.on 'SIGHUP', ->
    cmd.kill()
  cmd.on 'exit', (code) ->
    process.exit(code)
