
//Version mejorada y eficiente de los mapas de google.

var where = window.location.pathname;
var mapOptions;
var map;
//var marker;
var position2 = [];
var markers = []; 
//var infoWindow;
var textoInfo= "LorempImpsu"
var lat = 20.6763
var lon = -103.3422
var dragm = false;

var keepMarker;

$(document).ready(function(){ 

	//Control de acciones segun la página en que se esta ejecutando.

	if(where == '/' )
	{
		createMap(lat,lon);
	}else if(where == '/evento/nuevo')
	{
		createMap(lat,lon);
		createMarker(lat,lon,true);
	}

})

function createMap(lat, lon)
{
		console.log("createMap: " + lat+"," + lon);
		
		mapOptions = { 
          center: new google.maps.LatLng(lat,lon),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
                 
        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            
}

function createMarkerInfo(lat,lon,texto,link,dragm)
{
		console.log("createMarker: " + lat+"," + lon);
		
		var marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(lat,lon),
        	draggable: dragm
        });
   				
		//marker.setTitle(texto);
		texto  = '<a href='+link+'>'+texto+'</a>';
		keepMarker = marker;
		
		var infoWindow = new google.maps.InfoWindow;
		infoWindow.setContent(texto);
		
		google.maps.event.addListener(marker, 'click', function(){
			infoWindow.open(map, marker);
        }); 
}

function createMarker(lat,lon,dragm)
{
	console.log("drgm="+ dragm);
	
	var marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(lat,lon),
        	draggable: dragm
        });
    
    keepMarker = marker;
}

function loadMarker(lat,lon,dragm)
{
	console.log("loadMarker: " + lat+"," + lon);
		
		var marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(lat,lon),
        	draggable: dragm
        });
        keepMarker = marker;
}

function getMarkerPosition()
{
	 
	 position2[0] =  keepMarker.getPosition().lat() //Lat
     position2[1] =  keepMarker.getPosition().lng() //Log
     
     //alert("marker position\nLatitud: " + position2[0] + "\nLogitud: " + position2[1]);
     return position2;
}


