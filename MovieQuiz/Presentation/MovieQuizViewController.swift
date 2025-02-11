import UIKit

final class MovieQuizViewController: UIViewController, QuestionFactoryDelegate {
    
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
    private var questionFactory: QuestionFactoryProtocol?
    private var currentQuestion: QuizQuestion?
    
    var statisticService: StatisticServiceProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionFactory = QuestionFactory()
        questionFactory.setup(delegate: self)
        self.questionFactory = questionFactory
        
        questionFactory.requestNextQuestion()
        
        statisticService = StatisticService()
        
//        show(
//            quiz: convert(
//                model: questions[currentQuestionIndex]
//            )
//        )
//
    }
    
    // MARK: - UserDefaults
    
    let date = UserDefaults.standard.object(forKey: "bestGame.date") as? Date ?? Date()
    
//    func dictionaryRepresentation() -> [String: Any] {}
//
//    // Получаем словарь всех значений
//    let allValues = UserDefaults.standard.dictionaryRepresentation()
//
//    // Печатаем или обрабатываем все ключи и значения
//    for (key, value) in allValues {
//        print("\(key) - \(value)")
//    }
//
//    // Получаем все ключи словаря, затем в цикле удаляем их
//    allValues.keys.forEach { key in
//        UserDefaults.standard.removeObject(forKey: key)
//    }
    
    // MARK: - QuestionFactoryDelegate
    
    func didReceiveNextQuestion(question: QuizQuestion?) {
        guard let question = question else {
            return
        }
        
        currentQuestion = question
        let viewModel = convert(model: question)
        
        DispatchQueue.main.async { [weak self] in
            self?.show(quiz: viewModel)
        }
    }
    
    // MARK: - Actions
    
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
        
    // MARK: - Private functions
        
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
        
        //statisticService.resetStatistics() //перезаписать на пустую всю инфу из UserDefaults
        
        let alertPresenter = AlertPresenter(viewController: self)
        
        let totalAccuracy = String(format: "%.2f", statisticService.totalAccuracy)
        let bestGame = statisticService.bestGame
        
        if currentQuestionIndex == questionsAmount - 1 {
            let text = """
                Ваш результат: \(correctAnswers) из \(questionsAmount)
                Количество сыгранных квизов: \(statisticService.gamesCount)
                Рекорд: \(bestGame.correct) из \(questionsAmount) (\(bestGame.date.dateTimeString))
                Средняя точность: \(totalAccuracy)%
            """
            
            statisticService.store(correct: correctAnswers, total: questionsAmount)
            
            let alertModel = AlertModel(
                title: "Этот раунд окончен!",
                message: text,
                buttonText: "Сыграть еще раз",
                completion: { [weak self] in
                    self?.questionFactory?.requestNextQuestion()
                }
                
            )
            
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            
            alertPresenter.showAlert(model: alertModel)
            
            imageView.layer.borderWidth = 0
            
        } else {
            currentQuestionIndex += 1
            
            self.questionFactory?.requestNextQuestion()
            
            imageView.layer.borderWidth = 0
            
        }
    }
}

