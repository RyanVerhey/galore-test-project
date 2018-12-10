// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Running when the document has loaded
document.addEventListener("DOMContentLoaded", function() {
  // only running if the popout detail element is there
  const popoutDetail = document.getElementById("popout-detail");
  if (popoutDetail != null) {
    setUpPopoutDetail(popoutDetail);
  }
});

function setUpPopoutDetail(popoutDetail) {
  let popoutOpenElements = document.querySelectorAll("[data-show-popout]");
  for (let element of popoutOpenElements) {
    element.addEventListener('click', e => {
      popoutDetail.classList.remove("hidden");
    });
  }

  document.body.addEventListener('ajax:success', e => {
    let jsonData = JSON.parse(e.detail[2].responseText);
    fillInEventDetails(jsonData);
    document.getElementById('loading').classList.add('hidden');
    document.getElementById('event-conatiner').classList.remove('hidden');
    initMap();
  });

  let buttonCloseElements = document.querySelectorAll("[data-close-button]");
  for (let element of buttonCloseElements) {
    element.addEventListener("click", e => {
      e.preventDefault();
      // So child elements aren't effected, only the ones we want
      if (e.target === element) {
        popoutDetail.classList.add("hidden");
        document.getElementById('loading').classList.remove('hidden');
        document.getElementById('event-conatiner').classList.add('hidden');
        let fields = document.getElementsByClassName('data-field');
        for (let field of fields) {
          field.innerHTML = "";
        }
      }
    });
  }
}

function fillInEventDetails(event) {
  document.getElementById("event-title").innerHTML = event.location.name;
  document.getElementById("event-title").setAttribute('href', '/events/' + event.id);
  document.getElementById("location-name").innerHTML = event.location.name;
  document.getElementById("location-address-1").innerHTML = event.location.address_line_1;
  if (event.location.address_line_2 !== null) {
    let address2 = document.getElementById("location-address-2");
    let lineBreak = document.createElement("br");

    address2.innerHTML = event.location.address_line_2;
    address2.parentNode.insertBefore(lineBreak, address2.nextSibling);
  }
  document.getElementById("location-city").innerHTML = event.location.city;
  document.getElementById("location-district").innerHTML = event.location.district;
  document.getElementById("location-post-code").innerHTML = event.location.post_code;
  document.getElementById("event-description").innerHTML = event.description;
  document.getElementById("event-start-time").innerHTML = event.start_time;
  document.getElementById("event-end-time").innerHTML = event.end_time;
  document.getElementById("latitude").innerHTML = event.location.latitude;
  document.getElementById("longitude").innerHTML = event.location.longitude;
}
