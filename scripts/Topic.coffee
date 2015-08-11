moldule.exports = robot ->
 robot.hear / (\ topic | ^ topic) $ / i, (msg) ->
    room = msg.envelope.room
    msg.send robot.adapter.bot.chans[room].topic
