document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    var questionNumber = progressBar.dataset.questionNumber
    var questionsCount = progressBar.dataset.questionsCount

    var progressPercent = questionNumber / questionsCount * 100 + "%"
    progressBar.style.width = progressPercent
  }
})
