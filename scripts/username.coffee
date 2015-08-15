module.exports = (robot) ->
  robot.hear /name (.*)/i, (res) ->
    text = message.user.rawtext
    res.send text
