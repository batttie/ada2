module.exports = (robot) ->
  robot.hear /rm/i, (msg) ->
    room = JSON.stringify (msg.message)
    msg.send "#{room}"

