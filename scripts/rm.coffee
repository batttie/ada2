module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = room = msg.message.rawmessage.channel
    res.send "room"

