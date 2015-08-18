module.exports = (robot) ->
  robot.hear /show (.*)/i, (res) ->
    tes = res.match[1]
    user = robot.brain.userForId msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{tes}"
    robot.send {room: tes}, "Greetings!"
