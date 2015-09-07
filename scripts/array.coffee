module.exports = (robot) ->
  robot.hear /array/i, (res) ->
    x = [1,2,3,4,5,6]
    res.send x
