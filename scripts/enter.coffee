module.exports = (robot) ->
 robot.enter (msg) ->
    room = msg.message.envelope.room
    user = robot.brain.userForId msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    msg.send "<!@everyone> welcome <@user> to #{room}"
    if room == "testing"
     robot.send {room: msg.envelope.user.name}, "OMFG #{room}"
    if room == "tresses"
     robot.send {room: msg.envelope.user.name}, "OHSHIT #{room}"
    if room == "_general_"
     robot.send {room: msg.envelope.user.name}, "OHSHIT #{room}"
