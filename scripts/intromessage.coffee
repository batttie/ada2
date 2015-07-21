#
#
#
module.exports = (robot) ->
  robot.enter (msg) ->
    room = msg.message.room
    switch
      when room = "testing" then msg.reply "hi you are in #{room}  This is a public room designed for testing mine and my counterparts varius commands"
      when room = "tresses" then msg.reply "hi you are in #{room}  This is a private room designed for testing mine and my counterparts varius commands"
      else msg.send "idk where you are"
 
