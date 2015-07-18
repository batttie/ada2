#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki/i, (res) ->
    res.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=2072")
         .get() (err, msg, body) ->
           data = JSON.parse(body)
           data1 = data[1][title]
           res.send data1
