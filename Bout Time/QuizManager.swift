//
//  QuizManager.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 07/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit

class QuizManager {
    var events: [Event]
    var firstText: UITextView
    var secondText: UITextView
    var thirdText: UITextView
    var fourthText: UITextView
    var eventIndex: Int = 0
    var event1: Event?
    var event2: Event?
    var event3: Event?
    var event4: Event?
    
    init(events: [Event], firstText: UITextView, secondText: UITextView, thirdText: UITextView, fourthText: UITextView){
        self.events = events
        self.firstText = firstText
        self.secondText = secondText
        self.thirdText = thirdText
        self.fourthText = fourthText
    }
    
    ///shuffle events array
    func shuffleEvents(){
         events = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: self.events) as! [Event]
    }
    
    func checkOrder() {
        
    }
    
    func startGame() {
        shuffleEvents()
        startRound()
    }
    
    func startRound() {
        //add new texts on game. Raise the index number for the next round
        event1 = events[eventIndex]
        event2 = events[eventIndex + 1]
        event3 = events[eventIndex + 2]
        event4 = events[eventIndex + 3]
        eventIndex += 4
        
        updateTexts()
    }

    func updateTexts() {
        firstText.text = event1?.eventName
        secondText.text = event2?.eventName
        thirdText.text = event3?.eventName
        fourthText.text = event4?.eventName
    }
}
