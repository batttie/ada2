geocoder = require('geocoder')

exports.modules = (robot) ->
  robot.hear /geo (.*)/i, res ->
    gqueary = res.match[1]
    geocoder.geocode(gqueary)( err, data )
    res.send data.stringify
