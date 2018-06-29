$(".welcome.index").ready(function(event) {
  setupPage();
  $(window).on("scroll", debouncedLoadNextPage);
});

const loadNextPage = _.throttle(e => {
  if (isElementInViewport(document.getElementsByClassName("pagination"))) {
    console.log("yoyo");
    $("a[rel=next]").click();
  }
}, 250);

const setupPage = () => {
  console.log("setupPage called");
  if (isElementInViewport(document.getElementsByClassName("pagination"))) {
    $("a[rel=next]").click();
    debouncedSetup();
  } else {
    $(".loading").removeClass("invisible");
  }
};

const debouncedSetup = _.debounce(setupPage, 420);
const debouncedLoadNextPage = _.debounce(loadNextPage, 420);
