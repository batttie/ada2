module.exports = (robot) ->
  robot.hear /wiki search (.*)/i, (res) ->
    query = res.match[1]
    robot.http("http://ingress.wikia.com/api/v1/Search/List?query=#{query}&rank=stable&limit=100&minArticleQuality=10&batch=1&namespaces=0%2C14")
    .get() (err, msg, body) ->
     data = JSON.parse body
     num = data.total
     while num >= 0
       num = num - 1
       res.send "#{data.items[num].title}\n#{data.items[num].id}"
      res.send "done"
    robot.hear /wiki show (.*)/i, (res) ->
      id = res.match[1]
      robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
        .get() (err, msg, body) ->
         data = JSON.parse body
         lnt = data.sections.length
         xnum = -1
         while lnt >= xnum
           xnum = xnum + 1
           datan = data.sections[xnum]
           htitle = datan.title
           clnt = datan.content.lenght
           res.send "*#{htitle}*"
           cnum = -1
           while clnt >= cnum
             cnum = cnum + 1
             content = data.sections[xnum].content[cnum].text
             res.send "#{content}"
            res.send "done #{xnum} #{cnum} #{clnt}"
          res.send "done"
#    if query is "ada"
#        id = 2072
#        robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
#         .get() (err, msg, body) ->
#           data = JSON.parse(body)
#           
#           lvl = data.sections[0].level
#           
#           res.send "#{title} #{lvl} #{content}"
#           res.send data.sections[0].title, data.sections[0].content[0].text
#    else
#      res.send "i do not know that term, try again."
