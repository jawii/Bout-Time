//
//  GameEndController.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 08/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import UIKit

class GameEndController: UIViewController {
    
    var score: Int = 0
    var gameObject: QuizManager!
    
    @IBOutlet weak var scoreText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreText.text = "\(score)/\(gameObject.totalRoundNumbers)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgain() {
        gameObject.startGame()
        dismiss(animated: true, completion: nil)
    }

}
