$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Undermines authority
module.exports = class VPN extends Move
  constructor: () ->
    super 'VPN'

  getDamage: () ->
    return Math.max(0, @user.clash / 3)

  use: (cb) ->
    super()
    damage = @getDamage()
    extra = 'This EVADES the GREAT FIREWALL and UNDERMINES the AUTHORITY of the JUDGE. Their civility drops
             to ' + @user.civility + ' but they make some good points! '
    if @user.has 'FLED'
      extra += 'Since ' + @user.name + ' is in CHINA, the ATTACK is SUPER EFFECTIVE!'
      damage += 2
    else
      extra += if damage < 0.25 then 'It was not very effective' else ''

    @target.damage(damage)
    @announce cb, extra
