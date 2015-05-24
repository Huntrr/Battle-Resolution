$ = require('./lib/jquery.js')

# Basic debater class. Controls an actor in the game
module.exports = class Debater
  constructor: (@game, @opponent) ->
    @me = if @opponent then @game.opponent else @game.player
