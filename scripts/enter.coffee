module.exports = (robot) ->
 robot.enter (msg) ->
    room = msg.message.room
    user = msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    msg.send "<!channel> welcome <@#{user}> to #{room}"
    if room == "testing"
     robot.send {room: msg.envelope.user.name}, "Welcome to ##{room}.\n Tis is the mbenl playground to test out the fun toys that exist today.  Go ahead and have somefun.  Create something as awesome as me!"
    if room == "tresses"
     robot.send {room: msg.envelope.user.name}, "Welcome to #{room}.\n *GTFO*"
    if room == "_general_"
     robot.send {room: msg.envelope.user.name}, "Welcome to ##{room}.\nThis is the general chat room of mbenl.  You will see ALOT of conversation here.  I suggest for this channel you set your notifications so that only mentions of your name will alert you.  To see a list of commands type `helpmenu`  For more type `helpme`\n  feel free and join <#C02U2U6SX> as passcodes are sent to that channel time to time from other enlightened slack teams"
    if room == "secure-local-agents"
      robot.send {room: msg.envelope.user.name}, "Welcome to #{room}.  You have met the requirments to be invited to this secure group of people.  Please *DO NOT RE-SHARE* the information you gain here to those who are not apart of this group."
