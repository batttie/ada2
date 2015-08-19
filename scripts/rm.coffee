module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = JSON.stringify (msg.message.rawMessage)
    msg.send "#{room}"

