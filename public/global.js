var req = new XMLHttpRequest();

req.open("get", "/api_assignments");

req.addEventListener("load", function(){
  var container = document.getElementByID = ("main")
  container.innerHTML = this.response
})

req.responseType = "json";
req.send();



var req = new XMLHttpRequest();

req.open("get", "/api_assign_list/:id");

req.addEventListener("load", function(){
  for (var i = 0, i < this.response.length, i++){
    var container = document.getElementById = ("main")
    container.innerHTML = this.response[i]
  }
})

req.responseType = "json";
req
