module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = JSON.stringify (msg.message.rawmessage)
    msg.send "#{room}"

