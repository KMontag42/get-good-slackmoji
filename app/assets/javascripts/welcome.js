$(".welcome.index").ready(function(event) {
  setupPage();
  $(window).on("scroll", e => {
    if (isElementInViewport(document.getElementsByClassName("pagination"))) {
      $("a[rel=next]").click();
    }
  });
});

const setupPage = () => {
  if (isElementInViewport(document.getElementsByClassName("pagination"))) {
    setTimeout(() => {
      $("a[rel=next]").click();
      setTimeout(setupPage, 100);
    }, 250);
  }
};
