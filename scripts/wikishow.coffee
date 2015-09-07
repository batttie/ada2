sendtitle = ->
  While lnt >= xnum
  xnum = xnum + 1
  datan = data.sections[xnum]
  htitle = datan.title
  clnt = datan.content.length
  res.send "*#{htitle}*"

module.exports = (robot) ->
  robot.hear /wiki show (.*)/i, (res) ->
    id = res.match[1]
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
      .get() (err, msg, body) ->
       data = JSON.parse body
       lnt = data.sections.length
       xnum = -1
       sendtitle
       cnum = -1
       res.send "done #{xnum} #{cnum}"
       res.send "done"
