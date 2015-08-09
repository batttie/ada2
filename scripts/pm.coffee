module.exports = (robot) ->
  user_id = @client.getUserByName(envelope.room).id
  user = robot.brain.userForId(user_id)
  robot.hear /pfft/i, (res) ->
    res.message.user "pfft what"
