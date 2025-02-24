import UIKit

final class MovieQuizViewController: UIViewController {
    struct ViewModel {
        let image: UIImage
        let question: String
        let questionNumber: String
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: MovieQuizPresenter!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 20
        
        showLoadingIndicator()
        
        presenter = MovieQuizPresenter(viewController: self)
        
//        show(
//            quiz: convert(
//                model: questions[currentQuestionIndex]
//            )
//        )

    }
    
    // MARK: - UserDefaults
    
    let date = UserDefaults.standard.object(forKey: "bestGame.date") as? Date ?? Date()
    
    // MARK: - Actions
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.currentQuestion = presenter.currentQuestion
        presenter.yesButtonClicked()
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.currentQuestion = presenter.currentQuestion
        presenter.noButtonClicked()
    }
    
    // MARK: - Private functions

    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func show(quiz result: QuizResultsViewModel) {
        //statisticService.resetStatistics() //перезаписать на пустую всю инфу из UserDefaults
        
        let text = presenter.makeResultsMessage()
        
        let alertPresenter = AlertPresenter(viewController: self)
        
        let alertModel = AlertModel(
            title: "Этот раунд окончен!",
            message: text,
            buttonText: "Сыграть еще раз"
        )
        
        alertPresenter.showAlert(model: alertModel)
        
        imageView.layer.borderWidth = 0
    }

    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.cornerRadius = 6
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = false // говорим, что индикатор загрузки не скрыт
        activityIndicator.startAnimating() // включаем анимацию
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true // говорим, что индикатор загрузки не скрыт
    }
    
    func showNetworkError(message: String) {
        hideLoadingIndicator()
        
        let alertPresenter = AlertPresenter(viewController: self)
        
        let model = AlertModel(title: "Ошибка",
                               message: message,
                               buttonText: "Попробовать еще раз") { [weak self] in
            guard let self = self else { return }
            
            self.presenter.restartGame()
        }
        
        alertPresenter.showAlert(model: model)
    }    
}

