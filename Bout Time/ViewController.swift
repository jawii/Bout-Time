//
//  ViewController.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 06/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let dictionary = try PlistConverter.dictionary(fromFile: "events", ofType: "plist")
            
            let eventsArray = try EventsUnarchiver.eventsSelection(fromDictionary: dictionary)
            
            for event in eventsArray {
                print(event.time)
            }
        } catch let error {
            fatalError("\(error)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

