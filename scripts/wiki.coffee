sendcontent = ->
  While clnt >= cnum
  cnum = cnum + 1
  content = data.sections[xnum].content[cnum].text                                             
  res.send "#{content}"

sendtitle = ->
  While lnt >= xnum
  xnum = xnum + 1
  datan = data.sections[xnum]
  htitle = datan.title
  clnt = datan.content.length
  res.send "*#{htitle}*"
  sendcontent

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
         sendtitle
         sendcontent
         cnum = -1
         res.send "done #{xnum} #{cnum} #{clnt}"
         res.send "done"
