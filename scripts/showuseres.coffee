module.exports = (robot) ->
  robot.hear /show (.*)/i, (msg) ->
    noob = msg.match[1]
    user = robot.brain.userForId msg.envelope.user.id
    robot.logger.info "noob: #{noob}\nuser: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
  
