//
//  GameEndController.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 08/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import UIKit

class GameEndController: UIViewController {
    
    var score: Int!
    var gameObject: QuizManager!
    
    @IBOutlet weak var scoreText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In the viewDidLoad")
        scoreText.text = "1/\(score)"
        gameObject.startRound()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgain() {
        dismiss(animated: true, completion: nil)
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let newViewController = storyBoard.instantiateViewController(withIdentifier: "gameEndView")
        //self.present(newViewController, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
