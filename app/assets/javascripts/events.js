// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("DOMContentLoaded", function() {
  if (document.getElementById("popout-detail") !== null) {
    const edp = new EventDetailPopup("event-detail-link", "popout-detail", "close-button");
    edp.run();
  }
});

class EventDetailPopup {
  constructor(detailLinksClassName, popoutDetailIdName, closeButtonIdName) {
    this.detailLinks = document.getElementsByClassName(detailLinksClassName);
    this.popoutDetail = document.getElementById(popoutDetailIdName);
    this.closeButton = document.getElementById(closeButtonIdName);
  }

  run() {
    this.setupDetailPopupOpenEventListeners();
    this.setupClosePopoutDetailEventListener();
  }

  setupDetailPopupOpenEventListeners() {
    for (let link of this.detailLinks) {
      link.addEventListener("click", e => {
        e.preventDefault();

        let eventId = link.getAttribute("data-id");
        const xhr = new XMLHttpRequest();
        var self = this;

        xhr.onload = function () {
          if (xhr.status >= 200 && xhr.status < 300) {
            self.fillInEventDetails(JSON.parse(xhr.responseText));
            initMap();
          }
        };

        xhr.open('GET', `/ajax/events/${eventId}.json`);
        xhr.send();

        this.popoutDetail.classList.remove("hidden");
      });
    }
  }

  setupClosePopoutDetailEventListener() {
    const closePopoutDetail = e => {
      e.preventDefault();
      this.popoutDetail.classList.add("hidden");
    }

    this.closeButton.addEventListener("click", closePopoutDetail);

    this.popoutDetail.addEventListener("click", e => {
      if (e.target === this.popoutDetail) {
        closePopoutDetail(e);
      }
    });
  }

  fillInEventDetails(event) {
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
}
