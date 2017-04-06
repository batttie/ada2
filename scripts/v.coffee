modules.export = (robot) ->
  robot.hear /who is (.*)/i, Z(res) ->
  query = res.match [1]
  robot.http("https://v.enl.one/api/v1/search?apikey=75ee9d691f3493d413d207c6994d4ec0&&query=batttie")
  .get() (err, msg, body) ->
   res.send body
