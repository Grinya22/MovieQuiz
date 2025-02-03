import UIKit

final class MovieQuizViewController: UIViewController {
    
    struct ViewModel {
        let image: UIImage
        let question: String
        let questionNumber: String
    }
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    
    private let questionsAmount: Int = 10
    private var questionFactory: QuestionFactoryProtocol = QuestionFactory()
    private var currentQuestion: QuizQuestion?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstQuestion = questionFactory.requestNextQuestion() {
            currentQuestion = firstQuestion
            let viewModel = convert(model: firstQuestion)
            show(quiz: viewModel)
        }
        
//        show(
//            quiz: convert(
//                model: questions[currentQuestionIndex]
//            )
//        )
//
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        let givenAnswer = true
        guard let currentQuestion = currentQuestion else {
            return
        }
        
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        let givenAnswer = false
        guard let currentQuestion = currentQuestion else {
            return
        }
        
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)"
        )
        return questionStep
    }
    
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
//        if let firstQuestion = self.questionFactory.requestNextQuestion() {
//            self.currentQuestion = firstQuestion
//            let viewModel = self.convert(model: firstQuestion)
//
//            self.show(quiz: viewModel)
//        }
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.cornerRadius = 6
        
        if isCorrect == true {
            imageView.layer.borderColor = UIColor.ypGreen.cgColor
            correctAnswers += 1
            
        } else {
            imageView.layer.borderColor = UIColor.ypRed.cgColor
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.showNextQuestionOrResults()
        }
    }
    
    private func showNextQuestionOrResults() {
//        if currentQuestionIndex == questions.count - 1 {
//
//            let viewModel = QuizResultsViewModel(
//                title: "Этот раунд окончен!",
//                text: "Ваш результат: \(correctAnswers)/10",
//                buttonText: "Сыграть еще раз")
//            show(quiz: viewModel)
        
        if currentQuestionIndex == questionsAmount - 1 {
            let text = correctAnswers == questionsAmount ?
                "Поздравляем, вы ответили на 10 из 10!" :
                "Вы ответили на \(correctAnswers) из 10, попробуйте ещё раз!"
            
            let resultsViewModel = QuizResultsViewModel(
                title: "Раунд окончен!",
                text: text,
                buttonText: "Сыграть еще раз"
            )
            self.show(quiz: resultsViewModel)
            
            imageView.layer.borderWidth = 0
            
        } else {
            currentQuestionIndex += 1
            
            if let firstQuestion = self.questionFactory.requestNextQuestion() {
                self.currentQuestion = firstQuestion
                let viewModel = self.convert(model: firstQuestion)
                
                self.show(quiz: viewModel)
            }
            
            imageView.layer.borderWidth = 0
            
        }
    }
    
    private func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(title: result.title,
                                      message: result.text,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Сыграть еще раз", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            
            if let nextQuestion = self.questionFactory.requestNextQuestion() {
                self.currentQuestion = nextQuestion
                let viewModel = self.convert(model: nextQuestion)
                
                self.show(quiz: viewModel)
            }
            
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}


