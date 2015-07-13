var allAssign = function(){
var req = new XMLHttpRequest();

req.open("get", "/api_assignments");

req.addEventListener("load", function(event){
  var container = document.getElementById = ("all");
  container.innerHTML= this.response;
  event.preventDefault();
})
}

req.responseType = "json";
req.send();


var singleAssign = function(){
var req = new XMLHttpRequest();

req.open("get", "/api_assign_list/:id");

req.addEventListener("load", function(){
  for (var i = 0; i < this.response.length; i++){
    var container = document.getElementById = ("single");
    container.innerHTML = this.response[i];
  }
})
}

req.responseType = "json";
req.send();


document.getElementById("all_assign").onclick = allAssign;
