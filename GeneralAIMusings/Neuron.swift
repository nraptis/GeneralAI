//
//  Neuron.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Neuron {
    
    enum NeuronIndex {
        case input
        case output
        case body(Int)
    }
    
    var inputBits = [Bit]()
    var outputBits = [Bit]()
    
    var rules = [Rule]()
    
    /*
    func process() -> [Bit] {
        var result = [Bit]()
        return result
    }
    */
    
    var connections = [Neuron]()
    
    var ruleIndex = 0
    var bitIndex = 0
    
    func clone() -> Neuron {
        
        return Neuron()
    }
    
    func mutate() -> Neuron {
        
        let result = Neuron()
        
        let random_0_100 = Int.random(in: 0...100)
        
        var numberOfRulesToInsertAtHead = 0
        var numberOfRulesToInsertAtTail = 0
        
        if random_0_100 >= 90 {
            
            //
            // Puntuated Equilibrium
            // More Evoluton
            //
            
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
            result.rules.append(Rule.remove)
        }
        
        for rule in rules {
            // 1/26 deletion chance...
            if Int.random(in: 0...25) != 5 {
                result.rules.append(rule)
            }
            
            // 1/26 insertion chance...
            if Int.random(in: 0...25) != 5 {
                result.rules.append(Rule.random)
            }
        }
        
        for _ in 0..<numberOfRulesToInsertAtTail {
            result.rules.append(Rule.random)
        }
        
        return result
    }
    
    func appendByteToInput(byte: Byte) {
        inputBits.append(byte.bit0)
        inputBits.append(byte.bit1)
        inputBits.append(byte.bit2)
        inputBits.append(byte.bit3)
        
        inputBits.append(byte.bit4)
        inputBits.append(byte.bit5)
        inputBits.append(byte.bit6)
        inputBits.append(byte.bit7)
    }
    
}
