module.exports = (robot) ->
  
  robot.hear /pfft/i, (res) ->
    message = "pfft"
    robot.send {room: message.envelope.user.name}, message
