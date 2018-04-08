//
//  ViewController.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 06/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let events: [Event]
    var gameObject: QuizManager!
    
    @IBOutlet weak var firstText: UIButton!
    @IBOutlet weak var secondText: UIButton!
    @IBOutlet weak var thirdText: UIButton!
    @IBOutlet weak var fourthText: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var levelControlButton: UIButton!
    @IBOutlet weak var timerText: UITextView!
    

    required init?(coder aDecoder: NSCoder) {
        do{
            let dictionary = try PlistConverter.dictionary(fromFile: "events", ofType: "plist")
            let eventsArray = try EventsUnarchiver.eventsSelection(fromDictionary: dictionary)
            events = eventsArray
        } catch let error {
            fatalError("\(error)")
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(gameObject.events[0].site)
        gameObject = QuizManager(events: events, firstText: firstText, secondText: secondText, thirdText: thirdText, fourthText: fourthText, timerLabel: timerText, roundControlBtn: levelControlButton, infoLabel: infoLabel)
        
        gameObject.startGame()
        
        //shake
        self.becomeFirstResponder() //get the shake gesture
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake && gameObject.gameOn {
            gameObject.checkOrder()
        }
    }
    
    
    @IBAction func orderChange(_ sender: UIButton){
        let button = sender
        
        //take tempEvent
        var event : Event
        
        //change event places depending which button was pressed
        switch button.tag {
        case 1, 2:
            event = gameObject.event2
            gameObject.event2 = gameObject.event1
            gameObject.event1 = event
        case 3, 4:
            event = gameObject.event3
            gameObject.event3 = gameObject.event2
            gameObject.event2 = event
        case 5,6:
            event = gameObject.event4
            gameObject.event4 = gameObject.event3
            gameObject.event3 = event
        default:
            print("Something is wrong")
        }
        gameObject.updateTexts()
    }
    
    @IBAction func showInfo(_ sender: UIButton) {
        
        performSegue(withIdentifier: "EventInfoController", sender: self)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "EventInfoController")

        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func startNewRound() {
        gameObject.startRound()
    }

}

