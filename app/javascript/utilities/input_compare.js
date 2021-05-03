document.addEventListener("turbolinks:load" , function() {
  var confirmation = document.querySelector('#user_password_confirmation')
  var password = document.querySelector('#user_password')
  if (confirmation) { confirmation.addEventListener('input', function() { inputCompare(password, confirmation) }) }
  if (password) { password.addEventListener('input', function() { inputCompare(password, confirmation) }) }
})

function inputCompare(password, confirmation) {
  if (confirmation.value.length != 0) { 
    drawIcons(password, confirmation)
  } else {
    hideIcons()
  }
}

function drawIcons(password, confirmation) {
    if (confirmation.value === password.value) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  } else {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.remove('hide')
  }
}

function hideIcons() {
  document.querySelector('.octicon-check').classList.add('hide')
  document.querySelector('.octicon-x').classList.add('hide')
}


