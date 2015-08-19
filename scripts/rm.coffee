module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = JSON.stringify (msg.message.rawMessage.channel)
    msg.send "#{room}"

