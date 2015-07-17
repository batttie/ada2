#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki/i, (res) ->
    res.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=2072")
         .get() (err, msg, body) ->
           data = JSON.parse(body)
           stuff = data.section.title
           res.send stuff+msg+err+"request recieved"
