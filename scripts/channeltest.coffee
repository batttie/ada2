#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    room = #{channel.name}
    msg.reply room
  
