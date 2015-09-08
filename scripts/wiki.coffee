module.exports = (robot) ->
  robot.hear /wiki search (.*)/i, (res) ->
    query = res.match[1]
    message = ""
    robot.http("http://ingress.wikia.com/api/v1/Search/List?query=#{query}&rank=stable&limit=100&minArticleQuality=10&batch=1&namespaces=0%2C14")
    .get() (err, msg, body) ->
     data = JSON.parse body
     items = data.total
     num = -1
     res.send "I have found #{items} items for your search"
     while items - 1 > num
       num = num + 1
       message =data.items[num].title + "\n" + data.items[num].id + "\n"
     res.send "#{message}"
    res.send "#{message}"
