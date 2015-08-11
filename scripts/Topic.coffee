moldule.exports = robot ->
 robot.hear /topic/i, (res) ->
 topic = @client.getChannelGroupOrDMByName res.envelope.room
 robot.send #{topic}
