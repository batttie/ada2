module.exports = (robot) ->
 robot.enter (msg) ->
    room = msg.message.user.room
    user = robot.brain.userForId msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    robot.send {room: msg.envelope.user.name}, "Greetings! #{room}"
    if room == "testing"
     robot.send {room: msg.envelope.user.name}, "OMFG #{room}"
    if room == tresses
     robot.send {room: msg.envelope.user.name}, "OHSHIT #{room}"
