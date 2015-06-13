$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class AgressiveHighlight extends Move
  constructor: () ->
    super 'AGGRESIVE HIGHLIGHT'
    @messages = [
      'How much KNOWLEDGE have you applied in this debate?',
      'Have you taken enough AMBIGUOUS risks?',
      'Have you applied enough ACTIVE INQUIRY?',
      'Do you have enough CRITICAL THINKING?',
    ]

  getDamage: () ->
    dmg = (Math.floor(Math.random() * 4))
    return if dmg > 0.1 then dmg else 0.1

  use: (cb) ->
    super()

    dmg = @getDamage()
    if dmg < 2
      message = 'HAHA, YOU SCORED BEGINNING! I\'VE SEEN FRESHMAN LENS PROJETS WITH MORE FLUENCY.'
    else if dmg < 3
      message = 'NICE, YOU SCORED DEVELOPING! YOUR CRITICAL THINKING SKILLS ARE ALMOST MIDDLE-SCHOOL TIER!'
    else if dmg < 4
      message = 'GOOD, YOU SCORED ACCOMPLISHED! NOW I MIGHT EVEN READ THE REST OF YOUR ESSAY!'
    else
      message = 'GREAT JOB, YOU SCORED EXEMPLARY! YOU ARE NOW THE MODEL TEENAGED COMPATRIOT!!'
    message = message.concat('\n' + @user.name + ' dealt ' + dmg + ' damage!')
    @target.damage(dmg)
    @announce (err) =>
      @game.console.put @user.name + ': ' + message, cb
    ,@messages[Math.floor(Math.random() * @messages.length)]
