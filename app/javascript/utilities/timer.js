document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')
  
  if (timer) {
    startCountDown(timer)
  }
})

function startCountDown(timer) {
  var timerValue = timer.dataset.time
  var testPassageId = timer.dataset.testPassageId
  
  setInterval(() => {
    if (timerValue > 0 ) {
      timerValue -= 1
    } else {
      window.location.href = '/test_passages/' + testPassageId + '/result'
    }
    
  var timerMinutes = parseInt(timerValue / 60)
  var timerSeconds = parseInt(timerValue % 60)

  var timerTimeLeft = "Время до завершения теста: " + timerMinutes + "м " + timerSeconds + "c"
  timer.innerHTML = timerTimeLeft
  }, 1000)
}
