"use strict";

var initMap = function() {
  var icons = {
    origin: {
      icon: '/images/mapicons/truck.png'
    },
    destination: {
      icon: '/images/mapicons/destination.png'
    }
  };

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: {
      lat: -23.594908,
      lng: -46.686052
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  this.loadUserLocationAndTraceRoute = function() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        traceRoute(position.coords.latitude, position.coords.longitude);
      }, function() {
        alert('Não foi possível obter sua localização :(');
      });
    } else {
      alert('Seu navegador não suporta o recurso de geolocalização :(');
    }
  }

  this.traceRoute = function(latitude, longitude) {
    $.ajax({
      type: "POST",
      url: '/trace_routes',
      dataType: "json",
      data: {
        lat: latitude,
        lng: longitude
      },
      success: function(data) {
        if (data) {
          updateMap(data);
        } else {
          alert('Desculpe, nenhuma rota foi encontrada.');
        }
      },
      error: function() {
        alert('Parece que algo deu errado no servidor :(');
      }
    });
  }

  this.updateMap = function(traceData) {
    var routeCoordinates = [];

    createInfoPanel(traceData);

    addMarker({
      position: new google.maps.LatLng(traceData.start_location[0], traceData.start_location[1]),
      type: 'origin'
    });

    addMarker({
      position: new google.maps.LatLng(traceData.end_location[0], traceData.end_location[1]),
      type: 'destination'
    });

    for(var i = 0; i < traceData.steps.length; i++) {
      routeCoordinates.push({
        lat: traceData.steps[i].start_location[0],
        lng: traceData.steps[i].start_location[1]
      });
    }

    routeCoordinates.push({
      lat: traceData.end_location[0],
      lng: traceData.end_location[1]
    })

    var routePath = new google.maps.Polyline({
      path: routeCoordinates,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });

    routePath.setMap(map);
    centerMap(traceData.start_location, traceData.end_location);
  }

  this.centerMap = function(start_location, end_location) {
    var latlngbounds = new google.maps.LatLngBounds();
    latlngbounds.extend(new google.maps.LatLng(start_location[0], start_location[1]));
    latlngbounds.extend(new google.maps.LatLng(end_location[0], end_location[1]));
    map.setCenter(latlngbounds.getCenter());
    map.fitBounds(latlngbounds);
  }

  this.addMarker = function (feature) {
    var marker = new google.maps.Marker({
      position: feature.position,
      icon: icons[feature.type].icon,
      map: map
    });
  }

  this.createInfoPanel = function(traceData) {
    var details = document.createElement('div');
    details.setAttribute('id', 'details');
    details.innerHTML = '<h6>Informações</h6>';

    var div = document.createElement('div');
    div.innerHTML = '<strong>Distância:</strong> '+ traceData.distance +'<br>';
    div.innerHTML += '<strong>Duração:</strong> '+ traceData.duration;
    details.appendChild(div);

    map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(details);
  }

  loadUserLocationAndTraceRoute();
};
