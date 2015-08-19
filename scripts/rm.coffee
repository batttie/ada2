module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = JSON.stringify (msg.message[3])
    msg.send "#{room}"

