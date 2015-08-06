#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki/i, (res) ->
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=2072")
         .get() (err, msg, body) ->
           data = JSON.parse(body)
           title = "#{require('util').inspect(data.sections[0].title)}"
           lvl = "#{require('util').inspect(data.sections[0].level)}"
           content = "#{require('util').inspect(data.sections[0].content)}"
           text = "#{require('util').inspect(content[0].text)}"
           res.send title+lvl+text
           
