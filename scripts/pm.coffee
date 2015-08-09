module.exports = (robot) ->
  user = robot.brain.userForId(user_id)
  robot.hear /pfft/i, (res) ->
    res.message.user "pfft what"
