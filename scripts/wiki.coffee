#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki/i, (res) ->
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=2072")
         .get() (err, msg, body) ->
           data = JSON.parse(body)
           wa = #{require('util').inspect(data.sections[0].title)}
           res.send wa
           
