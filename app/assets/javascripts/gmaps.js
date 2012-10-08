
//variables a las que siempre quiero tener acceso.

var where = window.location.pathname;
var mapOptions;
var map;
var marker;
var position = [];


$(document).ready(function(){ 
	//Cuando termine de cargar CUALQUIER página,osea se ejecuta SIEMPRE
	mostrarMapa();

})

function mostrarMapa()
{
	if(where == '/' || where == '/evento/nuevo')
	{
		initialize();
		
	}

}

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
	 position[0] =  marker.getPosition().Xa; //Lat
     position[1] =  marker.getPosition().Ya; //Log
     return position;
}

function cargarMapa(lat, lon)
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
        	draggable: false
        });

	//window.onload=initialize;

}
 