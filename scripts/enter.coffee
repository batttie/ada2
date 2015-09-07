module.exports = (robot) ->
 robot.enter (msg) ->
    room = msg.message.room
    user = msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    msg.send "<!channel> welcome <@#{user}> to #{room}"
    if room == "testing"
     robot.send {room: msg.envelope.user.name}, "OMFG #{room}"
    if room == "tresses"
     robot.send {room: msg.envelope.user.name}, "OHSHIT #{room}"
    if room == "_general_"
     robot.send {room: msg.envelope.user.name}, "OHSHIT #{room}"