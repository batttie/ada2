module.exports = (robot) ->
  robot.hear /wiki show (.*)/i, (res) ->
    id = res.match[1]
    res.send "obtaining article, please wait"
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
      .get() (err, msg, body) ->
       data = JSON.parse body
       lnt = data.sections.length - 1
       xnum = -1
       mssagetotal = ""
       while lnt > xnum
        cnum = -1
        xnum = xnum + 1
        datan = data.sections[xnum]
        htitle = datan.title
        clnt = datan.content.length - 1
        message = "*#{htitle} #{clnt}*"
        messagetotal = messagetotal + message
        while clnt > cnum
         cnum = cnum + 1
         hcontent = datan.content[cnum].text
         message = "#{hcontent}"
         messagetotal = messagetotal + message
      res.send "#{messagetotal}"
