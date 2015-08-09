module.exports = (robot) ->
  robot.hear /pfft/i, (res) ->
    res.dm "pfft what"
