module.exports = (robot) ->
 robot.enter (msg) ->
   room = msg.user.room
    user = robot.brain.userForId msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    robot.send {room: msg.envelope.user.name}, "Greetings! #{room}"
