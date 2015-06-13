$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Ramble can BORE the opponent, temporarily reducing clash
# Example of a status effect move
module.exports = class Ramble extends Move
  constructor: () ->
    super 'RAMBLE'

  use: (cb) ->
    super()

    Bored = require 'effects/bored.coffee'
    # Only works if target isn't currently bored
    if @target.has('BORED')
      @announce cb, 'But ' + @target.name + ' was already BORED and
                                            the attack did nothing...'
    else
      # reduce clash (temporarily) by 2
      @target.addStatus new Bored(2, Math.floor(Math.random() * 3) + 1)
      @announce cb, @target.name + ' became BORED. Their CLASH fell!'
