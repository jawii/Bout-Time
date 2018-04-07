//
//  EventsProvider.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 07/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import Foundation


protocol EventData {
    var eventName: String { get }
    var time: Int { get }
    var site: String { get }
}

enum EventsConverterError : Error {
    case invalidResource
    case conversionFailure
}


struct Event :EventData{
    let eventName: String
    var time: Int
    var site: String
    
    init(time :Int, site: String, eventName: String){
        self.eventName = eventName
        self.time = time
        self.site = site
    }
}

class PlistConverter {
    
    static func dictionary(fromFile name :String, ofType type: String) throws -> [String: AnyObject]{
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw EventsConverterError.invalidResource
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String: AnyObject] else {
            throw EventsConverterError.conversionFailure
        }
        
        return dictionary
    }
}

///Returns Array Of Events
class EventsUnarchiver {
    static func eventsSelection(fromDictionary dictionary : [String: AnyObject]) throws -> [Event] {
        
        var events: [Event] = []
        for (key, value) in dictionary {
            if let dictionary = value as? [String: AnyObject], let time = dictionary["time"] as? Int, let site = dictionary["site"] as? String {
                let newEvent = Event(time: time, site: site, eventName: key)
                events.append(newEvent)
            }
        }
        return events
    }
}














