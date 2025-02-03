//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 03.02.2025.
//

import Foundation

protocol QuestionFactoryProtocol {
    func requestNextQuestion() -> QuizQuestion?
}
