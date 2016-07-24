//
//  ViewController.swift
//  boutTime
//
//  Created by Alex Millius on 22.07.16.
//  Copyright © 2016 TumTum. All rights reserved.
//

import Foundation
import UIKit

// MARK: Protocol
protocol RoundType {
    var event1:Position { get }
    var event2:Position { get }
    var event3:Position { get }
    var event4:Position { get }
    var currentCorrectOrder:[Position] { get }
    var currentRandomEvents:[Position] { get }
    init (event1:Position, event2:Position, event3: Position, event4: Position)
    func mooveUpEvent(events:[Position]) -> [Position]
    func mooveDownEvent(events:[Position]) -> [Position]
    func checkIfCorrectOrder(proposition proposition:[Position], correct:[Position]) -> Bool
}

protocol BoutTimeGame {
    init (rounds:[Round])
    var roundsInOrder:[Round] { get }
    static func randomizeEvent(events:[Position]) -> [Position]
}

// MARK: Error Type

enum eventsError: ErrorType {
    case InvalidResource(String)
    case ConversionError(String)
    case InvalidKey(String)
}

// - Helper

enum Position {
    case First(String)
    case Second(String)
    case Third(String)
    case Fourth(String)
}

//MARK: Converter

class PlistConverter {
    class func dictionaryFromFile(resource: String, ofType type: String) throws -> [String : AnyObject] {
        
        guard let path = NSBundle.mainBundle().pathForResource(resource, ofType: type) else {
            throw eventsError.InvalidResource("Invalid Ressource")
        }
        
        guard let Dictionary = NSDictionary(contentsOfFile: path), let castDictionary = Dictionary as? [String: AnyObject] else {
            throw eventsError.ConversionError("Conversion Error")
        }
        
        return castDictionary
    }
}

class EventUnarchiver {
    class func eventInventoryFromDictionary(dictionary: [String: AnyObject]) throws -> [RoundType] {
        
        var rounds = [RoundType]()
        
        for (_, value) in dictionary {
            if let eventDict = value as? [String: String], let event1 = eventDict["event1"], let event2 = eventDict["event2"], let event3 = eventDict["event3"], let event4 = eventDict["event4"] {
                
                let firstEvent = Position.First(event1)
                let secondEvent = Position.Second(event2)
                let thirdEvent = Position.Third(event3)
                let fourthEvent = Position.Fourth(event4)
                
                let round = Round(event1: firstEvent, event2: secondEvent, event3: thirdEvent, event4: fourthEvent)
                
                rounds.append(round)
            } else {
                throw eventsError.InvalidKey("Invalid Key")
            }
        }
        
        return rounds
    }
}


class Round:RoundType {
    var event1: Position
    var event2: Position
    var event3: Position
    var event4: Position
    var currentCorrectOrder: [Position]
    required init (event1:Position, event2:Position, event3: Position, event4: Position){
        self.event1 = event1
        self.event2 = event2
        self.event3 = event3
        self.event4 = event4
        self.currentCorrectOrder = [self.event1,self.event2,self.event3,self.event4]
    }
    
    var currentRandomEvents: [Position] {
        // TODO: implement code
        return [Position]()
    }
    
    func mooveUpEvent(events:[Position]) -> [Position] {
        // TODO: implement code
        return [Position]()
    }
    func mooveDownEvent(events:[Position]) -> [Position] {
        // TODO: implement code
        return [Position]()
    }
    func checkIfCorrectOrder(proposition proposition:[Position], correct:[Position]) -> Bool {
        
        // TODO: implement code
        return Bool()
    }
}

class GameControl: BoutTimeGame {
    let roundsInOrder:[Round]
    required init (rounds:[Round]) {
        self.roundsInOrder = rounds
    }
    
    class func randomizeEvent(events: [Position]) -> [Position] {
        // TODO: implement randomizer
        return [Position]()
    }
}




















