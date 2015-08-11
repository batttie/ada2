#
#
#
<<<<<<< HEAD
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    room = "#{channel.name}"
    msg.reply room

  robot.hear /(\ topic|^topic)$/i, (msg) ->
    room = msg.envelope.room
    msg.send robot.adapter.bot.chans[room].topic
=======
#module.exports = (robot) ->
#  robot.hear /room/i,(msg) ->
#    room = "#{channel.name}"
#    msg.reply room
>>>>>>> 2cd434d3aaa70fca910c1d3618983bb60a2dcc1c
  
