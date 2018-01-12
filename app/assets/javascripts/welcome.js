$(".welcome.index").ready(function(event) {
  setupPage();
  $(window).on("scroll", loadNextPage);
});

const loadNextPage = _.debounce(e => {
  if (isElementInViewport(document.getElementsByClassName("pagination"))) {
    console.log("yoyo");
    $("a[rel=next]").click();
  }
}, 250);

const setupPage = () => {
  if (isElementInViewport(document.getElementsByClassName("pagination"))) {
    setTimeout(() => {
      $("a[rel=next]").click();
      setTimeout(setupPage, 100);
    }, 250);
  } else {
    $(".loading").removeClass("invisible");
  }
};
