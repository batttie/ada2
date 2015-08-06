#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki (.*)/i, (res) ->
    query = res.match[1]
    if query = "ada"
        id = 2072
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
         .get() (err, msg, body) ->
           data = JSON.parse(body)
           title = data.sections[0].title
           lvl = data.sections[0].level
           content = data.sections[0].content[0].text
           res.send "#{title} #{lvl} #{content}"
           
