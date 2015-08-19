module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = room = msg.message[3].rawmessage.channel
    res.send "room"

