#module.exports = (robot) ->
# robot.hear /topic/i, (msg) ->
#    topic = @client.getChannelGroupOrDMByName msg.envelope.room
#    room = msg.envelope.room
#    #msg.send robot.adapter.bot.channel[room].topic
#    msg.send #{topic}
