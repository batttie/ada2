#
#
#
#
module.exports = (robot) ->
  robot.hear /wiki (.*)/i, (res) ->
    query = res.match[1]
    switch query
        when ada then id = 2072
        when axa then id = 3129
        robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
         .get() (err, msg, body) ->
           data = JSON.parse(body)
           title = data.sections[0].title
           lvl = data.sections[0].level
           content = data.sections[0].content[0].text
           res.send "#{title} #{lvl} #{content}"    
    else
      res.send "i do not know that term, try again."
