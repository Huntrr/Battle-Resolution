$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'

# Sample BORED effect reduces clash until expiration
module.exports = class Thrown extends Effect
  constructor: (@amount) ->
    @statusName = 'THROWN ' + @amount + ' SANDAL' + (if @amount is 1 then '' else 'S')
    super @statusName, -1 #Never expires

  invoke: (cb) ->
    super(cb)
    cb(null)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    cb(null)
