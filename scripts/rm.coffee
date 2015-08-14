module.exports = (robot) ->
  robot.hear /rm/i, (res)
    rm = rawMessage
    res.send rm.text
