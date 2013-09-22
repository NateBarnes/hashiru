class LocateMeBitch
  constructor: ->
    navigator.geolocation.getCurrentPosition (location) ->
      lat_lng = "#{location.coords.latitude},#{location.coords.longitude}"
      $.cookie "location", lat_lng

window.LocateMeBitch = LocateMeBitch
