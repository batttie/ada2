module.exports = (robot) ->
  robot.hear /rm/i, (res) ->
   # rm = rawMessage
    res.send SLACKRAWMESSAGE.text
