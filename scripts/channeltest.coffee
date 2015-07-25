#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    room = #{channel.name}
    msg.reply room

  robot.hear /(\ topic|^topic)$/i, (msg) ->
    room = msg.envelope.room
    msg.send robot.adapter.bot.chans[room].topic
  
