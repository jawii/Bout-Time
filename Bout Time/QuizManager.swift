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
    var roundControlBtn: UIButton
    
    var firstText: UIButton
    var secondText: UIButton
    var thirdText: UIButton
    var fourthText: UIButton
    var eventIndex: Int = 0
    var event1: Event
    var event2: Event
    var event3: Event
    var event4: Event
    
    var timeLabel: UITextView
    var infoLabel: UILabel
    
    var timer: Timer?
    var roundTime = 60
    
    var gameOn = true
    
    init(events: [Event], firstText: UIButton, secondText: UIButton, thirdText: UIButton, fourthText: UIButton, timerLabel: UITextView, roundControlBtn: UIButton, infoLabel: UILabel){
        self.events = events
        self.firstText = firstText
        self.secondText = secondText
        self.thirdText = thirdText
        self.fourthText = fourthText
        //These are dummy Values
        self.event1 = events[eventIndex]
        self.event2 = events[eventIndex + 1]
        self.event3 = events[eventIndex + 2]
        self.event4 = events[eventIndex + 3]
        self.timeLabel = timerLabel
        self.roundControlBtn = roundControlBtn
        self.infoLabel = infoLabel
    }
    
    ///shuffle events array
    func shuffleEvents(){
         events = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: self.events) as! [Event]
    }
    
    func checkOrder() {
        gameOn = false
        //stop the timer
        timer?.invalidate()
        timeLabel.isHidden = true
        //reveal the controlLabel
        roundControlBtn.isHidden = false
        //change labeltext to infoText about pressing the events
        infoLabel.text = "Tap Events to Show More"
        
        //go trough events and check if lower level has higher lower year
        if Int(event1.time) <= Int(event2.time) && Int(event2.time) <= Int(event3.time) && Int(event3.time) <= Int(event4.time) {
            correctAnswer()
        }
        else{
            wrongAnswer()
        }
    }
    
    func wrongAnswer() {
        print("Wrong Answer")
        roundControlBtn.setImage(UIImage(named: "next_round_fail.png"), for: .normal)
    }
    
    func correctAnswer() {
        print("Correct Answer")
        roundControlBtn.setImage(UIImage(named: "next_round_success.png"), for: .normal)
    }
    
    func startGame() {
        shuffleEvents()
        startRound()
    }
    
    func startRound() {
        gameOn = true
        //setup the labels and reveal the timer
        infoLabel.text = "Shake to complete"
        roundControlBtn.isHidden = true
        timeLabel.isHidden = false
        
        //add new texts on game. Raise the index number for the next round
        event1 = events[eventIndex]
        event2 = events[eventIndex + 1]
        event3 = events[eventIndex + 2]
        event4 = events[eventIndex + 3]
        eventIndex += 4
        
        //set index zero if it's out of events length
        //this is not going to happen at the end versiona
        if eventIndex + 5 > events.count {
            shuffleEvents()
            eventIndex = 0
        }
        
        roundTime = 60
        startTimer()
        updateTexts()
    }

    func updateTexts() {
        firstText.setTitle(event1.eventName, for: .normal)
        secondText.setTitle(event2.eventName, for: .normal)
        thirdText.setTitle(event3.eventName, for: .normal)
        fourthText.setTitle(event4.eventName, for: .normal)
    }
    
    ///Starts timer with timeInterval
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    ///Updates times
    ///@objc <- dunno what that means but hey, it works :>
    @objc func updateTimer(){
        //print(roundTime)
        roundTime -= 1
        
        if roundTime == 0 {
            checkOrder()
        }
        timeLabel.text = "0:\(roundTime)"
    }
}
