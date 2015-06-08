module.exports =
  # ---------------------
  # SET TRUE WHEN TESTING
  # ---------------------
  enabled: false

  # ---------------------
  # DEFINE THE ATTRIBUTES
  # ---------------------
  name: 'TESTY MCTESTYPANTS'
  level: 15
  health: 6
  clash: 5
  presentation: 6
  organization: 5
  civility: 5
  cross: 5

  # ----------------
  # DEFINE THE MOVES
  # ----------------
  moves: [
    require 'moves/flourish.coffee'
    require 'moves/clash.coffee'
    require 'moves/sandal.coffee'
    require 'moves/shout.coffee'
    require 'moves/rebuild.coffee'
    require 'moves/announce.coffee'
    require 'moves/philosophize.coffee'
    require 'moves/cross.coffee'
  ]

  # --------------------
  # DEFINE THE OPPONENTS
  # --------------------
  opponents: [
    require 'debaters/evan.coffee'
  ]
