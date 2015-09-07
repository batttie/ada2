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
  robot.hear /wiki show (.*)/i, (res) ->
    id = res.match[1]
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
      .get() (err, msg, body) ->
       data = JSON.parse body
       lnt = data.sections.length
       xnum = -1
       sendtitle
       cnum = -1
       res.send "done #{xnum} #{cnum} #{clnt}"
       res.send "done"
