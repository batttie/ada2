module.exports = (robot) ->
  robot.hear /wiki search (.*)/i, (res) ->
    query = res.match[1]
    message = ""
    res.send "I am now searching ingress.wikia.com for your query #{query}.\n*Please stand by.*"
    robot.http("http://ingress.wikia.com/api/v1/Search/List?query=#{query}&rank=stable&limit=100&minArticleQuality=10&batch=1&namespaces=0%2C14")
    .get() (err, msg, body) ->
     data = JSON.parse body
     items = data.total
     num = -1
     res.send "I have found #{items} items for your search"
     messagetotal = ""
     while items - 1 > num
       num = num + 1
      # res.send "#{data.items[num].title}" + "\n" + "#{data.items[num].id}" + "\n"
       message = "#{data.items[num].title}" + "\n" + "#{data.items[num].id}" + "\n"
       
       messagetotal = messagetotal + message
     res.send "#{messagetotal}"
     
     
  robot.hear /wiki show (.*)/i, (res) ->
    id = res.match[1]
    res.send "obtaining article, please wait"
    robot.http("http://ingress.wikia.com/api/v1/Articles/AsSimpleJson?id=#{id}")
      .get() (err, msg, body) ->
       data = JSON.parse body
       lnt = data.sections.length - 1
       xnum = -1
       messagetotal = ""
       while lnt > xnum
        cnum = -1
        xnum = xnum + 1
        datan = data.sections[xnum]
        htitle = datan.title
        clnt = datan.content.length - 1
        message = "*#{htitle}*" + "\n"
        messagetotal = messagetotal + message
        while clnt > cnum
         cnum = cnum + 1
         hcontent = datan.content[cnum].text
         message = "#{hcontent}" + "\n"
         messagetotal = messagetotal + message
       res.send "#{messagetotal}"
