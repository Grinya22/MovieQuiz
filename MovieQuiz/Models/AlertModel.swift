//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 05.02.2025.
//

import Foundation

struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    let completion: (() -> Void)?
}

