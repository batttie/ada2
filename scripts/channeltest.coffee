module.exports = (robot) ->
  robot.hear /pss/i, (msg) ->
    msg.send #{channel} pss
