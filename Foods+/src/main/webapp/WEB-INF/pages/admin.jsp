<!DOCTYPE html>
<html>
  <head>
    <title>Admin page</title>
    <link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/admin-style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  </head>

  <body>

    <div class="header">
      <img src="/Foods-1.0-SNAPSHOT/resources/pictures/logo.jpg">
    </div>

    <div class="wrapper">

      <div class="leftBar">

        <div id="newCafe" class="leftBarElement">
          <form id="newCafeForm" action="/Foods-1.0-SNAPSHOT/admin/new">
            <p>New cafe</p>
          </form>
        </div>

        <div id="cafes" class="leftBarElement">
            <p>See cafes</p>
        </div>

        <div id="logout" class="leftBarElement">
          <form id="logoutForm" action="/Foods-1.0-SNAPSHOT/admin/logout">
            <p>Logout</p>
          </form>
        </div>

      </div>

      <div class="content">
        <div id="cafesDiv"></div>
      </div>

    </div>

    <div class="footer">
    </div>

  <script>

    function getCafes(){
      var xhr = new XMLHttpRequest();
      xhr.open("GET", "/Foods-1.0-SNAPSHOT/cafes", true);
      xhr.send();

      xhr.onreadystatechange = function(){
        if(xhr.status == 200 && xhr.readyState == 4){
          loadCafes(JSON.parse(xhr.responseText.toString()));
        }
      }
    }

    function loadCafes(cafes){
      var cafesDiv = document.getElementById("cafesDiv");

      while(cafesDiv.firstChild){
        cafesDiv.removeChild(cafesDiv.firstChild);
      }

      for(var i = 0; i < cafes.length; i++){
        var currentCafe = cafes[i];

        var cafe = document.createElement("div");
        cafe.className = "cafe";

        var id = document.createElement("p");
        id.innerHTML = currentCafe["id"];
        id.style.display = "none";
        cafe.appendChild(id);

        var name = document.createElement("p");
        name.innerHTML += "Name: " + currentCafe["name"];
        cafe.appendChild(name);

        var description = document.createElement("p");
        description.innerHTML += "Description:" + currentCafe["description"];
        cafe.appendChild(description);

        var middleCost = document.createElement("p");
        middleCost.innerHTML += "Middle cost: " + currentCafe["middleCost"];
        cafe.appendChild(middleCost);

        var address = document.createElement("p");
        address.innerHTML += "Address: " + currentCafe["address"];
        cafe.appendChild(address);

        var contacts = document.createElement("p");
        contacts.innerHTML += "Contacts: " + currentCafe["contacts"];
        cafe.appendChild(contacts);

        var edit = document.createElement("button");
        edit.innerHTML = "Edit";
        edit.className = "editButton";
        edit.onclick = function(){
          changeCafe(this.parentNode);
        };
        cafe.appendChild(edit);

        var remove = document.createElement("button");
        remove.innerHTML = "Delete";
        remove.className = "removeButton";
        remove.onclick = function(){
          deleteCafe(this.parentNode);
        };
        cafe.appendChild(remove);

        cafesDiv.appendChild(cafe);
      }
    }

    function changeCafe(cafe){
      var id = cafe.childNodes[0].innerHTML;

      var form = document.createElement("form");
      form.action = "/Foods-1.0-SNAPSHOT/admin/change/" + id;
      form.method = "GET";
      form.submit();
    }

    function deleteCafe(cafe){

      var id = cafe.childNodes[0].innerHTML;

      var xhr = new XMLHttpRequest();
      xhr.open("DELETE", "/Foods-1.0-SNAPSHOT/admin/remove/" + id, true);
      xhr.send();

      xhr.onreadystatechange = function(){
        if(xhr.status == 200 && xhr.readyState == 4){
          loadCafes(JSON.parse(xhr.responseText.toString()));
        }
      }
    }

    $(document).ready(function(){
      $("#newCafe").on({
        click: function (){
          $("#newCafeForm").submit();
        }
      });

     $("#cafes").on({
        click: function() {
          getCafes();
        }
      });

      $("#logout").on({
        click: function (){
          $("#logoutForm").submit();
        }
      });
    })
  </script>
  </body>
</html>
