module.exports = (robot) ->
  robot.hear /name (.*)/i, (res) ->
    text = res.message.user.rawtext
    res.send text