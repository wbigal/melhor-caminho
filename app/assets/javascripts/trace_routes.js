function initMap() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      $.ajax({
        type: "POST",
        url: '/trace_routes',
        dataType: "json",
        data: {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        },
        success: function(data) {
          var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            center: {
              lat: data.start_location[0],
              lng: data.start_location[1]
            },
            mapTypeId: google.maps.MapTypeId.ROADMAP
          });

          var flightPlanCoordinates = [];
          for(var i = 0; i < data.steps.length; i++) {
            flightPlanCoordinates.push({
              lat: data.steps[i].start_location[0],
              lng: data.steps[i].start_location[1]
            })
          }
          var flightPath = new google.maps.Polyline({
            path: flightPlanCoordinates,
            geodesic: true,
            strokeColor: '#FF0000',
            strokeOpacity: 1.0,
            strokeWeight: 2
          });

          flightPath.setMap(map);
        }
      });

    }, function() {
      alert('Não foi possível obter sua localização :(');
    });
  } else {
    alert('Seu navegador não suporta o recurso de geolocalização :(');
  }
}
