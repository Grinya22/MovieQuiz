//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 09.02.2025.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    
    var correctAnswers: Int {
        get {
            UserDefaults.standard.integer(forKey: "correctAnswers")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "correctAnswers")
        }
    }
    
    var gamesCount: Int {
        get {
            UserDefaults.standard.integer(forKey: "gamesCount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "gamesCount")
        }
    }
    
    var bestGame: GameResult {
        get {
            guard let dictionary = UserDefaults.standard.dictionary(forKey: "bestGame") else {
                return GameResult(from: [:])
            }
            return GameResult(from: dictionary)
        }
        
        set {
            UserDefaults.standard.set(newValue.toDictionary(), forKey: "bestGame")
        }
    }
    
    var totalAccuracy: Double {
        if gamesCount != 0 {
            return Double(correctAnswers) / Double(gamesCount * 10) * 100
        } else { return 0 }
    }
            
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        correctAnswers += count
        
        let dictionary = [
            "correct": count,
            "total": amount,
            "date": GameResult.dateFormatter.string(from: Date())
        ] as [String : Any]
        
        let currentGame = GameResult(from: dictionary)
        
        if currentGame.isBetterThan(bestGame) {
            bestGame = currentGame
        }
    }
    
    func resetStatistics() {
        UserDefaults.standard.set(0, forKey: "gamesCount")
        UserDefaults.standard.set(0, forKey: "correctAnswers")
        UserDefaults.standard.set([:], forKey: "bestGame")
        //UserDefaults.standard.synchronize()
    }

}


