#
#
#
module.exports = (robot) ->
  robot.enter (msg) ->
    room = msg.message.room
    if room = testing
      msg.send "hi you are in testing"
    else
      msg.send "idk where you are"
 
