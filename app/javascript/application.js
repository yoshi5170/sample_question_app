// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "@fortawesome/fontawesome-free/js/all";

document.addEventListener("turbo:load", () => {
  let currentQuestion = 1;
  const totalQuestions = 10;

  const startButton = document.getElementById('start-diagnosis');
  const startDescription = document.getElementById('start-description');
  startButton.addEventListener('click', () => {
    startButton.classList.add('hidden');
    startDescription.classList.add('hidden');

    // 初めの質問を表示
    document.getElementById(`question_${currentQuestion}`).classList.remove('hidden');
  });
  document.addEventListener('click', (event) => {
    if (event.target.dataset.action === "next-question") {
      // 現在の質問で選択されている選択肢を取得
      const selectedOption = document.querySelector(`input[name="result[answer_${currentQuestion}]"]:checked`);

      if (!selectedOption) {
      // 選択されていない場合はエラーメッセージを表示して処理を終了
        document.getElementById(`error_${currentQuestion}`).classList.remove('hidden');
        return;
      } else {
        // 選択されている場合は、エラーメッセージが表示されている場合は隠す
        document.getElementById(`error_${currentQuestion}`).classList.add('hidden');
      }

      document.getElementById(`question_${currentQuestion}`).classList.add('hidden');
      if (currentQuestion === totalQuestions-1) {
        // 最後の質問なので、"次へ"ボタンを隠し、"回答する"ボタンを表示
        // event.target.classList.add('hidden');  // "次へ"ボタンを隠す
        document.getElementById('submit-button').classList.remove('hidden');  // "回答する"ボタンを表示
      }

      currentQuestion++;
      document.getElementById(`question_${currentQuestion}`).classList.remove('hidden');
    } else if(event.target.dataset.action === "previous-question") {
      document.getElementById(`question_${currentQuestion}`).classList.add('hidden');
      currentQuestion--;
      document.getElementById(`question_${currentQuestion}`).classList.remove('hidden');
    }
  });
});