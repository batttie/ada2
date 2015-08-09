module.exports = (robot) ->
  robot.hear /psst/i, (res) ->
    res.sendPrivate "psst what"
