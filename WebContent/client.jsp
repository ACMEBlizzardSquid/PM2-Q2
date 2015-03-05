<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Restful Client</title>
		<style type="text/css" media="screen">
/* And that's why I'm in CS */
body {width: 720px; margin: auto;}
button {display: block; min-width: 6em; margin: 0.5em}
div{padding: 1em 0em; border-bottom: 0.24em dashed gray; }
div:last-of-type{ border: none; }
label{color: burlywood; }
#temp{width: 3em;}
div:nth-child(2)::after {content: "degrees"; color: burlywood;}
.field{ display: block; }
		</style>
	</head>
	<body>
		<div>
			<button id="get_button">Get</button>
		</div>
		<div>
			<button id="put_button">Put</button>
			<label for="temp">Temperature</label>
			<input type="text" value="0" id="temp">
		</div>
		<div id="output" class="name">
		</div>
		<script type="text/javascript" charset="utf-8">

//------------------------------------- Event binding
document.getElementById("get_button").addEventListener("click", 
		function(){ doGetTemperature();});
document.getElementById("put_button").addEventListener("click", 
		function(){ doSetTemperature();});

//------------------------------------- Actions
function doGetTemperature(){
	rq = new XMLHttpRequest();
	rq.onreadystatechange = _requestStateCb;
	rq.open("get", uri, true);
	rq.setRequestHeader('Accept', 'application/xml');
	rq.send();
}
function doSetTemperature(){
	var temp    = document.getElementById("temp").value;
	var comp    = new Compositor();
	comp.addField("temp", temp);
	
	rq = new XMLHttpRequest();
	rq.onreadystatechange = _requestStateCb;
	rq.open("put", uri, true);
	rq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	rq.setRequestHeader('Accept', 'application/xml');
	rq.send(comp.getPayload());
}
function _requestStateCb(){
	if(rq.readyState === 4){
		showOutput(rq);
	}
}

//------------------------------------- XMLHttpRequest payload builder
var Compositor = function(){
	this.payload;
};

Compositor.prototype.addField = function(name, value){
	if(this.payload === undefined)
		this.payload = name+"="+value;
	else
		this.payload += "&"+name+"="+value;
}

Compositor.prototype.getPayload = function(){
	return this.payload;
}

// ------------------------------------- Display
var Writer = function (){
	this.bindings = [];
}

Writer.prototype.bind = function(nodeName, displayer){
	// Watch out for nodeName duplicates
	if(displayer instanceof Function)
		this.bindings.push({name: nodeName, display: displayer});
	else if(displayer instanceof Writer)
		this.bindings.push({name: nodeName, display: displayer.display});
}

Writer.prototype.display = function(xmlNode){
	var comp     = ""
	var nodeName = xmlNode.nodeName;
	this.bindings.forEach(function(n) {
		if(n.name == nodeName)
			comp += n.display(xmlNode);
	});
	return comp;
}

// builder
function getWriterInstance(){
	var w = new Writer();
	w.bind("temperature", function (node){
			var temp = node.childNodes[0].nodeValue;
			return _fieldWriter("Temperature",temp+" degrees");
		});
	return w;
}

function _fieldWriter(name, value){
	return "<span class=\"field\">" +name+": "+value+"</span>";
}

function showOutput(xmlRequest){
	outputFrame.innerHTML = "";
	// Header
	outputFrame.innerHTML += _fieldWriter("Status", rq.status);
	// Body
	if(xmlRequest.status === 200)
		outputFrame.innerHTML += writer.display(xmlRequest.responseXML.documentElement);
}

//------------------------------------- Global
uri    = "http://localhost:8080/Restest/Service/Temperature";
var outputFrame = document.getElementById("output");
var writer      = getWriterInstance();
var rq;

		</script>
	</body>
</html>
