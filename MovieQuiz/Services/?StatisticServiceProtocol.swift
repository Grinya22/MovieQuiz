//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 08.02.2025.
//

import Foundation

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(correct count: Int, total amount: Int)
    
    func resetStatistics()
}

