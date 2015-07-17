#
#
#
#
module.exports = (robot) ->
  robot.hear/wiki/i, (res) ->
    robot.http ("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=2072")
    .header('Content-Type', 'application/json')
    .get () (err, res, body)
     data = JSON.parse body
  res.send data
