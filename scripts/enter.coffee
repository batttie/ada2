module.exports = (robot) ->
 robot.enter (msg) ->
    room = msg.message.user.room
    user = robot.brain.userForId msg.envelope.user.id
    channelid = msg.message.rawMessage.channel
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    robot.send {room: 'room'}, "<!@everyone> welcome <@user> to <##channelid>"
    if room == "testing"
     robot.send {room: msg.envelope.user.name}, "OMFG <##channelid>"
    if room == "tresses"
     robot.send {room: msg.envelope.user.name}, "OHSHIT #{room}"
    if room == "_general_"
      robot.send {room: msg.envelope.user.name}, "OHSHIT #{room}"
