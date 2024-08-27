//
//  ViewController.swift
//  project-2
//
//  Created by Sueda Beyza Özcan on 26.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    
 
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
      
        askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        //soru = "whic one is correct flag?"
        title = countries[correctAnswer].uppercased()
        questionCount += 1
        scoreLabel.text = "Score: \(score)"
        
        if questionCount == 10 {
            let finalScoreAlert = UIAlertController(title: "Game Over", message: "Your final score is \(score).", preferredStyle: .alert)
            finalScoreAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                // Skoru sıfırlamak ya da uygulamayı yeniden başlatmak isterseniz buraya kod ekleyebilirsiniz
                self.resetGame()
            }))
            present(finalScoreAlert, animated: true)
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var message: String?
        var title: String?
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            scoreLabel.text = "Score: \(score)/10"
        }else {
            title = "Wrong"
            message = "This is the flag of \(countries[correctAnswer].uppercased())."
        }
        scoreLabel.text = "Score: \(score)/10"
            
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    func resetGame() {
        score = 0
        questionCount = 0
        askQuestion() // Yeni bir soru başlat
    }

    }

