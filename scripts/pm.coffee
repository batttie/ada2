module.exports = (robot) ->
  
  robot.hear /pfft/i, (res) ->
    message = "pfft"
    res.send {room: message.envelope.user.name}, message
