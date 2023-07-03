//
//  game manager.swift
//  Bullseye
//
//  Created by Hilola Dostieva  on 23/06/23.
//

import Foundation

class GameManager {
    //Угадываемое число.
    var guessingNumber: Int
    //Текущий счет игрока
    var score: Int
    // Текущий раунд
    var round: Int
    // Максимальное число раундов
    let maxRound = 10
    
    init(guessingNumber: Int, score: Int, round: Int) {
        self.guessingNumber = Int.random(in: 1...100) //сгенерировать число от 1 до 100
        self.score = 0
        self.round = 1
    }
    func nextRound() {
        print("Начинаем новый раунд")
        round = round + 1
        guessingNumber = Int.random(in: 1...100)
    }
    func startNewGame() {
        self.guessingNumber = Int.random(in: 1...100) //сгенерировать число от 1 до 100
        self.score = 0
        self.round = 1
    }
    
}
