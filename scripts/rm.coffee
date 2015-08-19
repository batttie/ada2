module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = msg.message
    res.send "room"

