$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Tim Huminski's favorite move. Does base damage of 0.5,
# Never very effective
module.exports = class Sandal extends Move
  constructor: () ->
    super 'THROW SANDAL'

  getDamage: () ->
    return 0.5

  use: (cb) ->
    super()
    @target.damage(@getDamage())
    @announce cb, 'It was not very effective... But then again it never really is, is it?'
