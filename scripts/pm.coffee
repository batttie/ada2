module.exports = (robot) ->
  user = user = @robot.brain.userForId msg.user
  robot.hear /pfft/i, (res) ->
    message = "pfft"
    robot.send {room: message.envelope.user.name}, message
