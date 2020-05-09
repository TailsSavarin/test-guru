document.addEventListener('turbolinks:load', function() {
  var confirmation = document.getElementById('user_password_confirmation')

  if (confirmation) { confirmation.addEventListener('input', confirmUserPassword ) }
})

function confirmUserPassword() {
  var password = document.getElementById('user_password').value
  var confirmation = document.getElementById('user_password_confirmation').value
  
  var successIcon = this.parentNode.querySelector('.octicon-shield-check')
  var failureIcon = this.parentNode.querySelector('.octicon-shield-x')

  var successText = this.parentNode.querySelector('small.text-success')
  var failureText = this.parentNode.querySelector('small.text-danger')


  if (!password || !confirmation) {
    successText.classList.add('hide')
    failureText.classList.add('hide')

    successIcon.classList.add('hide')
    failureIcon.classList.add('hide')

    this.classList.remove('border-danger')
    this.classList.remove('border-success')
    return
  } if (password === confirmation) { 
    successText.classList.remove('hide')
    failureText.classList.add('hide')

    successIcon.classList.remove('hide')
    failureIcon.classList.add('hide')

    this.classList.add('border-success')
    this.classList.remove('border-danger')
  } else {
    successText.classList.add('hide')
    failureText.classList.remove('hide')

    successIcon.classList.add('hide')
    failureIcon.classList.remove('hide')

    this.classList.remove('border-success')
    this.classList.add('border-danger')
  }
}

