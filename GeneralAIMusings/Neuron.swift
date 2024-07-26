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
    
    var name = ""
    
    let queue: NeuronQueue<WordType>
    init(queueSize: Int) {
        self.queue = NeuronQueue<WordType>(capacity: queueSize)
    }
    
    var rules = [Rule<WordType>]()
    var connections = [Neuron<WordType>]()
    
    var ruleIndex = 0
    var connectionIndex = 0
    var neuronIndex = 0
    
    var isVisited = false
    var isVisitedCurrentPulse = false
    
    
    func clone() -> Neuron {
        let result = Neuron(queueSize: queue.capacity)
        return result
    }
    
    func cycle() {
        ruleIndex += 1
        if ruleIndex >= rules.count {
            ruleIndex = 0
        }
        
        connectionIndex += 1
        if connectionIndex >= connections.count {
            connectionIndex = 0
        }
    }
    
    func clear() {
        connections.removeAll(keepingCapacity: true)
        queue.removeAll()
        isVisited = false
        isVisitedCurrentPulse = false
    }
    
    func getRuleCount() -> Int {
        return rules.count
    }
    
    func getCurrentRule() -> Rule<WordType>? {
        if ruleIndex >= 0 && ruleIndex < rules.count {
            return rules[ruleIndex]
        }
        return nil
    }
    
    func getCurrentConnection() -> Neuron? {
        if connectionIndex >= 0 && connectionIndex < connections.count {
            return connections[connectionIndex]
        }
        return nil
    }
    
    func write(words: [WordType]) {
        queue.write(words)
    }
}

extension Neuron: Equatable {
    static func == (lhs: Neuron<WordType>, rhs: Neuron<WordType>) -> Bool {
        lhs.neuronIndex == rhs.neuronIndex
    }
}

extension Neuron: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(neuronIndex)
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
