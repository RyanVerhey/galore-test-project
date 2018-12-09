// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("DOMContentLoaded", function() {
  if (document.getElementById("popout-detail") !== null) {
    eventDetailPopup();
  }
});

function eventDetailPopup() {
  let detailLinks = document.getElementsByClassName("event-detail-link"),
      popoutDetail = document.getElementById("popout-detail"),
      closeButton = document.getElementById("close-button");
  for (let link of detailLinks) {
    link.addEventListener("click", e => {
      e.preventDefault();
      popoutDetail.classList.remove("hidden");
      initMap();
    });
  }

  const closePopoutDetail = e => {
    e.preventDefault();
    popoutDetail.classList.add("hidden");
  }

  closeButton.addEventListener("click", closePopoutDetail);

  popoutDetail.addEventListener("click", e => {
    if (e.target === popoutDetail) {
      closePopoutDetail(e);
    }
  });
}
