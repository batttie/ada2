#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    msg.reply room
  
