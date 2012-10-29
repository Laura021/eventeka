
//variables a las que siempre quiero tener acceso.

var where = window.location.pathname;
var mapOptions;
var map;
var marker;
var position2 = [];
var markers = []; 

$(document).ready(function(){ 
	//Cuando termine de cargar CUALQUIER página,osea se ejecuta SIEMPRE
	
	//Vamos a ir decidiendo conforme a la pagina

	if(where == '/' )
	{
		//Aquie se hace la 1er localizacion del usuario.
		initialize();
		//localizarUser();
		
	}
	if(where == '/evento/nuevo')
	{
		initialize();
	}

})

function initialize() 
{
        mapOptions = {
          center: new google.maps.LatLng(20.6763, -103.3422),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
         
         map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
            
        marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(20.6763, -103.3422),
        	draggable: true
        });
	//window.onload=initialize;
}//fin de initialize
      
function cambiaCiudad(lat, lon)
{
	
	 mapOptions = {
          center: new google.maps.LatLng(lat, lon),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
         map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
            
         marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(lat,lon),
        	draggable: true
        });

	//window.onload=initialize;

}  

function markerPosition()
{     
	console.log(marker.getPosition());

	
	 position2[0] =  marker.getPosition().Ya; //Lat
     position2[1] =  marker.getPosition().Za; //Log
     
     //alert("marker position\nLatitud: " + position2[0] + "\nLogitud: " + position2[1]);
     return position2;
}

function cargarMapa(lat, lon)
{
	
	 mapOptions = {
          center: new google.maps.LatLng(lat, lon),
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
         map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
            
         marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(lat,lon),
        	draggable: false
        });

	//window.onload=initialize;

}

function editarMapa(lat, lon)
{
	
	 mapOptions = {
          center: new google.maps.LatLng(lat, lon),
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
         map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
            
         marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(lat,lon),
        	draggable: true
        });

	//window.onload=initialize;

}
// Codigo para localizar al usuario via browser.
var initialLocation;

var browserSupportFlag =  new Boolean();

function localizarUser()
{
	var myOptions = {
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  	};
  	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	
	if(navigator.geolocation) 
	{
    	browserSupportFlag = true;
    	navigator.geolocation.getCurrentPosition(function(position) {
      	initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      	//console.log("Latitud: " + position.coords.latitude);
      	//console.log("Longitud: " + position.coords.longitude);
      	cargarMapa(position.coords.latitude,position.coords.longitude);
      	//map.setCenter(initialLocation);
    	}, function() {
      	handleNoGeolocation(browserSupportFlag);
    	});
  	}else 
  	{
    	browserSupportFlag = false;
    	handleNoGeolocation(browserSupportFlag);
  	}
	
	function handleNoGeolocation(errorFlag) 
	{
		var siberia = new google.maps.LatLng(60, 105);
		var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
    	if (errorFlag == true) 
    	{
      		alert("Geolocation service failed.");
      		initialLocation = newyork;
    	} 
    	else 
    	{
      		alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      		initialLocation = siberia;
    	}
    	map.setCenter(initialLocation);
  	}

	
}//fin de localizacion


function eventosCiudad(ciudad_id)
{
	var direccion = '/servicios/ciudad_evento.json?id='+ciudad_id;
	var lat = "null", lon = "null";
	var i=0;
	console.log("Valor: " + direccion);
	
	$.getJSON(direccion,function(json)
	{
		console.log(json);
		var lat =  json.latitud;
		var lon =  json.longitud;
		
		marker =  new google.maps.Marker({
        	map: map,
        	position: new google.maps.LatLng(lat,lon),
        	draggable: false
        });
		
		console.log(lat +", "+ lon);
		
	});// fin del get
	
}

