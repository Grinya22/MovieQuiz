//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 04.02.2025.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {              
    func didReceiveNextQuestion(question: QuizQuestion?)
}

