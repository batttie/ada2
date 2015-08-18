module.exports = (robot) ->
  robot.hear /pfft/i, (msg) ->
    user = robot.brain.userForId msg.envelope.user.id
     use = JSON.stringfy(user)
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}n\ use: #{use}"
    robot.send {room: msg.envelope.user.name}, "Greetings!"
