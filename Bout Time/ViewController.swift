//
//  ViewController.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 06/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameObject: QuizManager
    
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
            gameObject = QuizManager(events: eventsArray)
        } catch let error {
            fatalError("\(error)")
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(gameObject.events[0].site)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

