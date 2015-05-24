$ = require('./lib/jquery.js')

# constants
dir = './img/char/'
ftype = '.png'

# Basic debater class. Controls an actor in the game
module.exports = class Debater
  constructor: (@game, @opponent = true, @name = 'SMITH', @level = 30,
                @case = 4, @type = 'DEBATER') ->
    @me = if @opponent then @game.opponentElem else @game.playerElem

  load: () ->
    @me.setImg(dir + @name + (if @opponent then '' else '_back') + ftype)
    @me.setName(@name)
    @me.setLevel(@level)
    @me.setStatus(@type)
    @me.setCase(@case)

  say: (what, cb) ->
    @game.console.put(@name + ': ' + what, cb)
