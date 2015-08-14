module.exports = (robot) ->
  robot.hear /name (.*)/i, (res) ->
     name = res.match[1]
     res.send message.text
  
