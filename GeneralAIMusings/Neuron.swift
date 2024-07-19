//
//  Neuron.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Neuron {
    
    enum MutationAction {
        case none
        case insert
        case delete
        case replace
    }
    
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
    
    enum NeuronIndex {
        case input
        case output
        case body(Int)
    }
    
    var inputBits = [Bit]()
    var outputBits = [Bit]()
    
    var rules = [Rule]()
    
    var connections = [Neuron]()
    
    var ruleIndex = 0
    var bitIndex = 0
    
    var index = 0
    
    func clone() -> Neuron {
        
        return Neuron()
    }
    
    func getRuleCount() -> Int {
        return rules.count
    }
    
    func mutate() -> Neuron {
        
        let result = Neuron()
        
        let random_0_100 = Int.random(in: 0...100)
        
        var numberOfRulesToInsertAtHead = 0
        var numberOfRulesToInsertAtTail = 0
        var isPunctuatedEquilibrium = false
        
        if random_0_100 >= 90 {
            
            //
            // Puntuated Equilibrium
            // More Evoluton
            //
            
            isPunctuatedEquilibrium = true
            
            numberOfRulesToInsertAtHead = Int.random(in: 0...25)
            numberOfRulesToInsertAtTail = Int.random(in: 0...25)
            
        } else {
            
            
            if Int.random(in: 0...10) == 0 {
                numberOfRulesToInsertAtHead = Int.random(in: 0...5)
            }
            if Int.random(in: 0...10) == 0 {
                numberOfRulesToInsertAtTail = Int.random(in: 0...5)
            }
        }
        
        for _ in 0..<numberOfRulesToInsertAtHead {
            result.rules.append(Rule.random)
        }
        
        for rule in rules {
            let mutationAction = Self.getMutationAction(isPunctuatedEquilibrium: isPunctuatedEquilibrium)
            switch mutationAction {
            case .none:
                result.rules.append(rule)
            case .insert:
                result.rules.append(rule)
                result.rules.append(Rule.random)
            case .delete:
                break
            case .replace:
                result.rules.append(Rule.random)
            }
        }
        
        for _ in 0..<numberOfRulesToInsertAtTail {
            result.rules.append(Rule.random)
        }
        
        return result
    }
    
    func appendWordToInput(word: Word) {
        inputBits.append(word.bit_00)
        inputBits.append(word.bit_01)
        inputBits.append(word.bit_02)
        inputBits.append(word.bit_03)
        inputBits.append(word.bit_04)
        inputBits.append(word.bit_05)
        inputBits.append(word.bit_06)
        inputBits.append(word.bit_07)
        
        inputBits.append(word.bit_08)
        inputBits.append(word.bit_09)
        inputBits.append(word.bit_10)
        inputBits.append(word.bit_11)
        inputBits.append(word.bit_12)
        inputBits.append(word.bit_13)
        inputBits.append(word.bit_14)
        inputBits.append(word.bit_15)
    }
    
}
