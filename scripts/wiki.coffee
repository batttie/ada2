#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki/i, (res) ->
    res.http ("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=2072")
     .get()  (err, res, body) ->
      data = JSON.parse body
      res.send data
