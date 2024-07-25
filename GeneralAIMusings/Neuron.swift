//
//  Neuron.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

enum NeuronIndex {
    case input
    case output
    case body(Int)
}

class Neuron<WordType: Wordable> {
    
    enum MutationAction {
        case none
        case insert
        case delete
        case replace
    }
    
    let queue: NeuronQueue<WordType>
    init(queueSize: Int) {
        self.queue = NeuronQueue<WordType>(capacity: queueSize)
    }
    
    var rules = [Rule]()
    
    var connections = [Neuron]()
    
    var ruleIndex = 0
    var connectionIndex = 0
    var neuronIndex = 0
    
    func clone() -> Neuron {
        
        let result = Neuron(queueSize: queue.capacity)
        
        return result
    }
    
    func getRuleCount() -> Int {
        return rules.count
    }
}

extension Neuron {
    
    static func getMutationAction(isPunctuatedEquilibrium: Bool) -> MutationAction {
        var randomNumber = Int.random(in: 0...99)
        if isPunctuatedEquilibrium {
            if randomNumber < 10 {
                return .insert
            } else if randomNumber < 20 {
                return .delete
            } else if randomNumber < 30 {
                return .replace
            } else {
                return .none
            }
        } else {
            if randomNumber < 2 {
                return .insert
            } else if randomNumber < 4 {
                return .delete
            } else if randomNumber < 6 {
                return .replace
            } else {
                return .none
            }
        }
    }
    
}
