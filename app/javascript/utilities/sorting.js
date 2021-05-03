document.addEventListener("turbolinks:load" , function() {
  var control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowByTitle) }
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

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('table')
  var tableBody = document.createElement('tbody')

  sortedTable.classList.add('table')
  sortedTable.appendChild(tableBody)
  tableBody.appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
    tableBody.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
