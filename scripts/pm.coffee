module.exports = (robot) ->
  user = user = @robot.brain.userForId msg.user
  robot.hear /pfft/i, (res) ->
    res.msg.user "pfft what"
