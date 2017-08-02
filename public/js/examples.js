function loadPerson(event) {
  event.preventDefault();

  var oReq = new XMLHttpRequest();
  oReq.addEventListener("load", function() {
    var person = JSON.parse(this.responseText);
    document.getElementById("person-avatar").setAttribute('src', person.avatar);
    document.getElementById("person-name").innerHTML = person.name;
    document.getElementById("person-birthday").innerHTML = person.birthday;
    document.getElementById("person-email").innerHTML = person.email;
    document.getElementById("person-title").innerHTML = person.title;
    document.getElementById("person-bio")
      .innerHTML = '<i>"' + person.bio + '"</i>';
  });
  oReq.open("GET", "/example/person");
  oReq.send();
}

function loadRobotMaster(event) {
  event.preventDefault();
  var master = "Bomb Man";

  var oReq = new XMLHttpRequest();
  oReq.addEventListener("load", function() {
    var master = JSON.parse(this.responseText);
    document.getElementById("master-avatar").setAttribute('src', master.avatar);
  });
  oReq.open("GET", "/example/megaman?master" = master);
  oReq.send();
}

document.getElementById("reload-button").onclick = loadPerson;
Reveal.addEventListener('loadPerson', loadPerson);

Reveal.addEventListener('loadMaster', loadRobotMaster);

