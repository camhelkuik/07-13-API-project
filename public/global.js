var showAll = function(event){
  var req = new XMLHttpRequest();
  var href = this.getAttribute("href");

  req.open("get", href);

  req.addEventListener("load", function(){
    for(var i = 0; i < this.response.length; i++){
      var ul = document.getElementById("main")
      var li = document.createElement("li");
      li.appendChild(document.createTextNode(this.response[i].name));
      ul.appendChild(li);
    }
  })
  event.preventDefault();
  req.responseType = "json";
  req.send();
}

var showLinks = function(event){
  var req = new XMLHttpRequest();
  var href = this.getAttribute("href");

  req.open("get", href);

  req.addEventListener("load", function(){
    for(var i = 0; i < this.response.length; i++){
      var ul = document.getElementById("main")
      var li = document.createElement("li");
      li.appendChild(document.createTextNode(this.response[i].article_or_video));
      ul.appendChild(li);
    }
  })
  event.preventDefault();
  req.responseType = "json";
  req.send();
}

var showPartners = function(event){
  var req = new XMLHttpRequest();
  var href = this.getAttribute("href");

  req.open("get", href);

  req.addEventListener("load", function(){
    for(var i = 0; i < this.response.length; i++){
      var ul = document.getElementById("main")
      var li = document.createElement("li");
      li.appendChild(document.createTextNode(this.response[i].partner));
      ul.appendChild(li);
    }
  })
  event.preventDefault();
  req.responseType = "json";
  req.send();
}


document.getElementById("all_assign").onclick = showAll;
document.getElementById("all_links").onclick = showLinks;
document.getElementById("all_partners").onclick = showPartners;
