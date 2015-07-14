var showAll = function(event){
  var req = new XMLHttpRequest();
  var href = this.getAttribute("href");

  req.open("get", href);

  req.addEventListener("load", function(){
    var container = document.getElementById("main");
    container.innerHTML= this.response;
  })
  event.preventDefault();
  req.responseType = "json";
  req.send();
}


// var singleAssign = function(){
// var req = new XMLHttpRequest();
//
// req.open("get", "/api/assignment_id");
//
// req.addEventListener("load", function(){
//   for (var i = 0; i < this.response.length; i++){
//     var container = document.getElementById = ("single");
//     container.innerHTML = this.response[i];
//   }
// })
// }
//
// req.responseType = "json";
// req.send();


document.getElementById("all_assign").onclick = showAll;
document.getElementById("all_links").onclick = showAll;
document.getElementById("all_partners").onclick = showAll;
