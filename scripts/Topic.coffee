module.exports = (robot) ->
 robot.hear /topic/i, (msg) ->
    room = msg.envelope.room
    msg.send robot.adapter.bot.channel[room].topic
