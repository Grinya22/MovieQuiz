//
//  GameResault.swift
//  MovieQuiz
//
//  Created by Gregory Vanyurin on 08.02.2025.
//

import Foundation

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    init(from dictionary: [String: Any]) {
        self.correct = dictionary["correct"] as? Int ?? 0
        self.total = dictionary["total"] as? Int ?? 0
        
        let dateString = dictionary["date"] as? String ?? ""
        self.date = GameResult.dateFormatter.date(from: dateString) ?? Date()
    }
    
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "correct": correct,
            "total": total,
            "date": GameResult.dateFormatter.string(from: date)
        ]
    }
}
