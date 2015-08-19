module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = msg.message.rawMessage.channel
    msg.send "<##{room}>"

