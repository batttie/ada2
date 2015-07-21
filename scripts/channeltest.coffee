#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    room = envelope.room
    msg.reply room
  
