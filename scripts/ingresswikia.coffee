module.exports = (robot) ->
  robot.hear /wiki (.*)/i, (res) ->
    query = res.match[1]
    robot.http("http://ingress.wikia.com/api/v1/Search/List?query=#{query}&rank=stable&limit=100&minArticleQuality=80&batch=1&namespaces=0%2C14")
    .get() (err, msg, body) ->
     data = JSON.parse body
     num = data.total
     while num >= 0
       num = num - 1
       res.send {data.items[num].id}
#    if query is "ada"
#        id = 2072
#        robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
#         .get() (err, msg, body) ->
#           data = JSON.parse(body)
#           title = data.sections[0].title
#           lvl = data.sections[0].level
#           content = data.sections[0].content[0].text
#           res.send "#{title} #{lvl} #{content}"
#           res.send data.sections[0].title, data.sections[0].content[0].text
#    else
#      res.send "i do not know that term, try again."
