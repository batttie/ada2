moldule.exports = robot ->
 robot.hear /topic/i, (res) ->
 topic = @client.getChannelGroupOrDMByName envelope.room
 robot.send #{topic}
