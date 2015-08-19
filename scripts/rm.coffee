module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = room = msg.message.user.rawmessage.channel
    res.send "room"

