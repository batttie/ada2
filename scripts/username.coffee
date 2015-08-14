module.exports = (robot) ->
  robot.hear /name (.*)/i, (res) ->
     name = res.match[1]
     message = "hi"
     robot.send {room: message.envelope.user.name}, message
  
