module.exports = (robot) ->
  robot.hear /wiki search (.*)/i, (res) ->
    query = res.match[1]
    message = ""
    robot.http("http://ingress.wikia.com/api/v1/Search/List?query=#{query}&rank=stable&limit=100&minArticleQuality=10&batch=1&namespaces=0%2C14")
    .get() (err, msg, body) ->
     data = JSON.parse body
     num = data.total
     replimit = num
     rep = 0
     while replimit > rep
       num = num - 1
       rep = rep + 1
       message = + data.items[num].title"\n" + data.items[num].id"\n"
     res.send "#{message}"
