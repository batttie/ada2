module.exports = (robot) ->
  robot.hear /pfft/i, (res) ->
    res.message.user "pfft what"
