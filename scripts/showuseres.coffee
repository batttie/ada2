module.exports = (robot) ->
  robot.respond /show (.*)/i, (res) ->
    tes = res.match[1]
    res.send "tes"
