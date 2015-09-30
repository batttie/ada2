geocoder = require('geocoder')

module.exports = (robot) ->
  robot.hear /geo (.*)/i, (res) ->
    gqueary = res.match[1]
    geocoder.geocode("Atlanta, GA") ( err, data ) ->
     res.send "#{err}"
     res.send "#{data}"

