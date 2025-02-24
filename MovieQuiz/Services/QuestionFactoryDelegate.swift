//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 04.02.2025.
//

import Foundation

protocol QuestionFactoryDelegate {
    func didLoadDataFromServer() // сообщение об успешной загрузке
    func didFailToLoadData(with error: Error) // сообщение об ошибке загрузки
    func didReceiveNextQuestion(question: QuizQuestion?)
}

