module.exports = (robot) ->
  robot.hear /show (.*)/i, (res) ->
    tes = res.match[1]
    robot.send {room: tes}, "Greetings!"
