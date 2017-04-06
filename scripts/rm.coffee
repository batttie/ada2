module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    channelid = msg.message.rawMessage.channel
    msg.send "<##{channelid}>"

