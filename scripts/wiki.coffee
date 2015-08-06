#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki/i, (res) ->
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=2072")
         .get() (err, msg, body) ->
           data = JSON.parse(body)
             res.send data[0]
