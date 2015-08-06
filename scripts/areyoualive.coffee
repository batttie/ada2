module.exports = (robot) ->
  robot.hear /are you alive/i, (res) ->
    res.send "yes I am alive"
