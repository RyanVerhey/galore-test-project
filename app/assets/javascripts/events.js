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

        this.popoutDetail.classList.remove("hidden");
        initMap();
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
}
