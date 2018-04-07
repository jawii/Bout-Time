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
    
    @IBOutlet weak var firstText: UITextView!
    @IBOutlet weak var secondText: UITextView!
    @IBOutlet weak var thirdText: UITextView!
    @IBOutlet weak var fourthText: UITextView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var levelControlButton: UIButton!
    

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
        gameObject = QuizManager(events: events, firstText: firstText, secondText: secondText, thirdText: thirdText, fourthText: fourthText)
        
        gameObject.startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func orderChange(_ sender: UIButton){
        let button = sender
        
        //take tempEvent
        var event : Event
        
        //change event places depending which button was pressed
        switch button.tag {
        case 1, 2:
            event = gameObject.event2!
            gameObject.event2 = gameObject.event1
            gameObject.event1 = event
        case 3, 4:
            event = gameObject.event3!
            gameObject.event3 = gameObject.event2
            gameObject.event2 = event
        case 5,6:
            event = gameObject.event4!
            gameObject.event4 = gameObject.event3
            gameObject.event3 = event
        default:
            print("Something is wrong")
        }
        gameObject.updateTexts()
    }

}

