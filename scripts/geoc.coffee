geocoder = require('geocoder')

module.exports = (robot) ->
  robot.hear /geo (.*)/i, (res) ->
    gqueary = res.match[1]
    geocoder.geocode(gqueary)( err, data ) ->
     res.send err
     res.send data
  robot.catchAll (response) ->
  console.log('catch all: ', response)
