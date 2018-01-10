function isElementInViewport(el) {
  var rect = el[0].getBoundingClientRect();
  return rect.top > -1 && rect.bottom - 2 <= $(window).height();
}
