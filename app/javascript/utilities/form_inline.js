document.addEventListener('turbolinks:load', function() {
  // var controls = document.querySelectorAll('.form-inline-link')

  // if (controls.length) {
  //   for (var i = 0; i < controls.length; i++) {
  //     controls[i].addEventListener('click', formInLineLinkHandler)
  //   }
  // }
  $('.form-inline-link').on('click', formInLineLinkHandler)
  
  var errors = document.querySelector('.resource-errors')
  link = document.querySelector('.form-inline-link')
  if (errors && link) {
    var resourceId = errors.dataset.resourceId
    formInLineHandler(resourceId)
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInLineHandler(testId)
}

function formInLineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  $formInline.toggle()
  $testTitle.toggle() 

  if ($formInline.is(':visible')) {
    link.textContent = I18n.t('common.cancel')
  } else {
    link.textContent = I18n.t('common.edit')
  }
}
