var showAll = function(event){
  var req = new XMLHttpRequest();
  var href = this.getAttribute("href");

  req.open("get", href);

  req.addEventListener("load", function(){
    for(var i = 0; i < this.response.length; i++){
      var ul = document.getElementById("all")
      var li = document.createElement("li");
      var a = document.createElement("a");
      a.setAttribute("href", "/api/assignment_id?id=" + this.response[i].id);
      a.appendChild(document.createTextNode(this.response[i].name));
      li.appendChild(a);
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
      var ul = document.getElementById("links")
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
      var ul = document.getElementById("partners")
      var li = document.createElement("li");
      li.appendChild(document.createTextNode(this.response[i].partner));
      ul.appendChild(li);
    }
  })
  event.preventDefault();
  req.responseType = "json";
  req.send();
}

var deleteAssign = function(event){
  var req = new XMLHttpRequest();
  var href = this.getAttribute("href");

  req.open("get", href);

  req.addEventListener("load", function(){
    for(var i = 0; i < this.response.length; i++){
      var ul = document.getElementById("add")
      var li = document.createElement("li");
      var a = document.createElement("a");
      a.setAttribute("href", "/api/delete_assign?id=" + this.response[i].id);
      a.appendChild(document.createTextNode(this.response[i].name));
      li.appendChild(a);
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
document.getElementById("delete_assignment").onclick = deleteAssign;