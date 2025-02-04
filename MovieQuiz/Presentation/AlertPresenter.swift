//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 05.02.2025.
//

import UIKit

class AlertPresenter {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    
    func showAlert(model: AlertModel) {
        
//        let text = correctAnswers == questionsAmount ?
//        "Поздравляем, вы ответили на 10 из 10!" :
//        "Вы ответили на \(correctAnswers) из 10, попробуйте ещё раз!"
//
//        let resultsAlertModel = AlertModel(
//            title: "Раунд окончен!",
//            text: text,
//            buttonText: "Сыграть еще раз"
//        )
//
        
        let alert = UIAlertController(title: model.title,
                                      message: model.message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Сыграть еще раз", style: .default) { _ in
            model.completion?()
//            self.currentQuestionIndex = 0
//            self.correctAnswers = 0
//
//            self.questionFactory?.requestNextQuestion()
            
        }
        
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
        
    }
}


/*
 if currentQuestionIndex == questionsAmount - 1 {
     let text = correctAnswers == questionsAmount ?
     "Поздравляем, вы ответили на 10 из 10!" :
     "Вы ответили на \(correctAnswers) из 10, попробуйте ещё раз!"
     
     
     let completion = AlertModel(title: "Сыграть еще раз", message: text, buttonText: "Сыграть еще раз") { _ in
         
     }
 }
}
*/

/*
private func showNextQuestionOrResults() {

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
      
      self.questionFactory?.requestNextQuestion()
      
      imageView.layer.borderWidth = 0
      
  }
}
*/

/*
private func show(quiz result: QuizResultsViewModel) {
  let alert = UIAlertController(title: result.title,
                                message: result.text,
                                preferredStyle: .alert)
  
  let action = UIAlertAction(title: "Сыграть еще раз", style: .default) { [weak self] _ in
      guard let self = self else { return }
      
      self.currentQuestionIndex = 0
      self.correctAnswers = 0
      
      self.questionFactory?.requestNextQuestion()
  }
  
  alert.addAction(action)
  
  self.present(alert, animated: true, completion: nil)
}

*/

