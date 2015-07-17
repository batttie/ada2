#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    room = msg.message.room
    msg.reply room
  
