#
#
#
module.exports = (robot) ->
  robot.enter (msg) ->
    if user.room = testing
      msg.send "hi you are in testing"
    else
      msg.send "idk where you are"
 
