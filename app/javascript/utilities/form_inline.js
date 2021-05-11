document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInLineLinkHandler)
    }
  }

  var errors = document.querySelector('.resource-errors')
  console.log(errors)
  if (errors) {
    var resourceId = errors.dataset.resourceId
    console.log(resourceId)
    formInLineHandler(resourceId)
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  console.log(testId)
  formInLineHandler(testId)
}

function formInLineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
  console.log(formInline)

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    link.textContent = "Cancel"
    console.log(formInline)
  } else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    link.textContent = "Edit"
  }
}
