//
//  ViewController.swift
//  Bullseye
//
//  Created by Hilola Dostieva  on 21/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessingLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var rulesLabel: UILabel!
    
    @IBOutlet weak var buttond: UIButton! //UIView / CALayer
    
    
    let gameManager = GameManager(guessingNumber: Int.random(in: 1...100), score: 0, round: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("I am in view controller")
        print(gameManager.guessingNumber)
        
        
        let thumbImage = UIImage(named: "Nub")
        slider.setThumbImage(thumbImage, for: .normal)
        rulesLabel.text = rulesLabel.text?.uppercased()
        updateLabels()
        
        //CALayer
        buttond.layer.cornerRadius = 21
        buttond.layer.borderColor = UIColor.white.cgColor
        buttond.layer.borderWidth = 3
       
        scoreLabel.layer.cornerRadius = 21
        scoreLabel.layer.borderWidth = 2
        scoreLabel.layer.borderColor = UIColor(named: "labels border")?.cgColor

        
        
        roundLabel.layer.cornerRadius = 21
        roundLabel.layer.borderWidth = 2
        roundLabel.layer.borderColor = UIColor(named: "labels border")?.cgColor
        
        //gradient
//        let gradient = CAGradientLayer()
//        gradient.colors = [CGColor(red: 0, green: 0, blue: 50, alpha: 1)]
//        buttond.layer.addSublayer(gradient)
        


        //UIView
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        blueview.addGestureRecognizer(tapGesture)
//
        //  ^
        //  |
        //  |
    }   //  |
    
//    @objc func handleTap() {
//        printContent("tap me")
//    }
    
    
    @IBAction func handleButtonTap(_ sender: Any) {
        print(slider.value)
        
        //угадал - 100, приблизительно - 50 (+- 10)
        let selectedNumber = Int(slider.value)
        
        if Int(slider.value) == gameManager.guessingNumber {
            print("Вы угадали число")
            gameManager.score = gameManager.score + 100 //gameManager.score += 100 -= /= *=
        } else if abs(gameManager.guessingNumber - selectedNumber) <= 10{ //abs means absolute/module |-145| = 145
            print("Вы почти угадали число")
            gameManager.score = gameManager.score + 50
        }
        else {
            print("Попробуйте еще раз")
        }
        
        //Проверка на конец игры
        if gameManager.round < 10 {
            gameManager.nextRound()
            updateLabels()
        } else {
            gameOverAlert()
        }
        updateLabels()
    }
    
    
    func updateLabels() {
        guessingLabel.text = String(gameManager.guessingNumber)
        scoreLabel.text = String(gameManager.score)
        roundLabel.text = String(gameManager.round)
    }
    func gameOverAlert() {
        let myAlert = UIAlertController(title: "Game over", message: "Ваши очки: \(gameManager.score)\n Начать новую игру?", preferredStyle: .alert)
        let handler: ((UIAlertAction) -> Void)? = { action in
            print("Start new game")
            self.gameManager.startNewGame()
            self.updateLabels()
        }
        let action = UIAlertAction(title: "Начать", style: .default, handler: handler)
        myAlert.addAction(action)
        
        let cancelAction = UIAlertAction(title: "Закончить игру", style: .cancel)
        myAlert.addAction(cancelAction)
        
        
        show (myAlert, sender: self)
    }

}

