module.exports = (robot) ->
  robot.hear /pfft/i, (res) ->
    user = robot.brain.userForId msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    robot.messageRoom {room: msg.envelope.user.name}, "Enter your token here: "
