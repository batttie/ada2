#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    room = msg.message.room
    msg.reply room

  robot.hear /(\ topic|^topic)$/i, (msg) ->
    room = msg.envelope.room
    msg.send robot.adapter.bot.chans[room].topic
  
