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
  if (event.keyCode == 13 || !event.keyCode) {
    var master = document.getElementById('master-input').value;

    var oReq = new XMLHttpRequest();
    oReq.addEventListener("load", function() {
      var master = JSON.parse(this.responseText);
      document.getElementById("master-avatar").setAttribute('src', master.avatar);

      document.getElementById('master-damage').innerHTML = '';
      for(var w in master.damage) {
        var line = document.createElement('tr');

        var columnW = document.createElement('td');
        columnW.innerHTML = w;
        line.appendChild(columnW);

        var columnD = document.createElement('td');
        columnD.innerHTML = master.damage[w];
        line.appendChild(columnD);
        
        document.getElementById('master-damage').appendChild(line);
      }
    });
    oReq.open("GET", "/example/megaman?master=" + master);
    oReq.send();

    return false;
  }
}

document.getElementById("reload-button").onclick = loadPerson;
Reveal.addEventListener('loadPerson', loadPerson);

document.getElementById("master-input").onkeypress = loadRobotMaster;
Reveal.addEventListener('loadMaster', loadRobotMaster);

