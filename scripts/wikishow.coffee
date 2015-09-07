module.exports = (robot) ->
  robot.hear /wiki show (.*)/i, (res) ->
    id = res.match[1]
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
      .get() (err, msg, body) ->
       data = JSON.parse body
       lnt = data.sections.length
       xnum = -1
       while lnt >= xnum
        cnum = -1
        xnum = xnum + 1
        datan = data.sections[xnum]
        htitle = datan.title
        clnt = datan.content.length
        res.send "*#{htitle} #{clnt}*"
        while clnt >= cnum
         cnum = cnum + 1
         hcontent = datan.content[cnum].text
         res.send "#{hcontent}"
