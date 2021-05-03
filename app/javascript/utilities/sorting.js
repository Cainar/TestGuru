document.addEventListener("turbolinks:load" , function() {
  var control = document.querySelector('.sort-by-title')
  control.addEventListener('click', sortRowByTitle)
})

function sortRowByTitle() {

  // NodeList
  // https://developer.mozilla.org/en-US/docs/Web/API/NodeList
  var table = document.querySelector('table')
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  //select all table rows exept the first one which is the header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }
  console.log(sortedRows)
}
