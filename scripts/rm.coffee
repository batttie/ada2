module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = room = msg.message[3].channel
    res.send "room"

