module.exports = (robot) ->
  robot.hear /rm/i, (res) ->
    room = room = msg.message.rawmessage.channel
    res.send "room"

