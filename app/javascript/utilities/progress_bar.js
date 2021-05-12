document.addEventListener("turbolinks:load" , function() {
  var bar = document.querySelector(".progress-bar")
  if (bar) {
    var percent = bar.dataset.percent
    bar.setAttribute("style", "width: " +  percent)
  }
})
